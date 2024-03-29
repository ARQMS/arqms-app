import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:ARQMS/data/idf_localctrl_datasource.dart';
import 'package:ARQMS/data/parse_datasource.dart';
import 'package:ARQMS/models/device/device.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

abstract class DeviceService {
  Future<List<Device>> broadcast(Duration duration);

  Future<bool> setup(
    Device device, {
    String? roomName,
    int? interval,
    String? brokerUri,
    String? ssid,
    String? ssidPwd,
  });

  Future<bool> connect(Device device);
  Future<String> readConfigurationString({required String name});
  Future<int> readConfigurationInt({required String name});
  Future reload();

  void cancelBroadcast();
}

class DeviceServiceImpl implements DeviceService {
  static const String DEFAULT_DEVICE_PASSWORD = "AirRoom!2022";
  static const String DEFAULT_DEVICE_PREFIX = "AR-";

  final ParseDataSource parseDataSource;
  final LocalCtrlDataSource localCtrlDataSource;
  String? lastSSID;
  Completer<List<Device>>? deviceSearchCompletion;
  List<Device> devices = [];

  DeviceServiceImpl({
    required this.parseDataSource,
    required this.localCtrlDataSource,
  });

  @override
  Future<bool> setup(Device device,
      {String? roomName,
      int? interval,
      String? brokerUri,
      String? ssid,
      String? ssidPwd}) async {
    // 1) receive device information
    await localCtrlDataSource.reloadProperties();
    var serialNumber = await readConfigurationString(name: "SerialNumber");

    // 2) send configuration to device
    await _writeConfigurationString(name: "BrokerUri", value: brokerUri);
    await _writeConfigurationInt(name: "Interval", value: interval);
    await _writeConfigurationString(name: "Wifi_SSID", value: ssid);
    await _writeConfigurationString(name: "Wifi_PWD", value: ssidPwd);

    // 3) swap back to previous wlan
    var currentSSID = await WiFiForIoTPlugin.getSSID();
    if (currentSSID != lastSSID && lastSSID != null) {
      await WiFiForIoTPlugin.removeWifiNetwork(currentSSID!);
      await WiFiForIoTPlugin.disconnect();

      // Just to be sure wifi switched back
      await WiFiForIoTPlugin.connect(lastSSID!, withInternet: true);
    }

    await Future.delayed(const Duration(seconds: 5));

    // 4) register serialnumber with current logged in account
    return await parseDataSource.registerDevice(
      serialNumber: serialNumber,
    );
  }

  @override
  Future<List<Device>> broadcast(Duration duration) async {
    devices.clear();

    // Ensure wifi is enabled
    if (!await WiFiForIoTPlugin.isEnabled()) {
      await WiFiForIoTPlugin.setEnabled(true);
    }

    // back up SSID when available to restore wlan after device registration
    if (await WiFiForIoTPlugin.isConnected()) {
      lastSSID = await WiFiForIoTPlugin.getSSID();
    }

    // start scan and wait for results
    await WiFiScan.instance.startScan(askPermissions: true);

    deviceSearchCompletion = Completer<List<Device>>();
    var wifiStream = WiFiScan.instance.onScannedResultsAvailable.listen(
      (results) {
        if (results.hasError) {
          // TODO
          return;
        }

        devices.addAll(
          results.value!.where(_isWifiADevice).map((result) => Device(result)),
        );
        if (devices.isNotEmpty) {
          cancelBroadcast();
        }
      },
      onDone: () async {
        cancelBroadcast();
      },
      cancelOnError: true,
    );

    // start timeout
    var timeout = Timer(duration, cancelBroadcast);

    // wait until search is completed
    var result = await deviceSearchCompletion!.future;

    // do not receive any future events
    wifiStream.cancel();
    timeout.cancel();

    return result;
  }

  @override
  void cancelBroadcast() {
    if (deviceSearchCompletion?.isCompleted != true) {
      deviceSearchCompletion!.complete(devices);
    }
  }

  // TODO https://stackoverflow.com/questions/39311853/android-force-network-requests-go-through-wifi-instead-of-mobile-network
  // Android sends data via mobile network, whenever wifi has no internet connection, so we must ensure data is transfered over wifi
  @override
  Future<bool> connect(Device device) async {
    return await WiFiForIoTPlugin.findAndConnect(
      device.ssid,
      joinOnce: true,
      bssid: device.bssid,
      password: DEFAULT_DEVICE_PASSWORD,
    );
  }

  @override
  Future<String> readConfigurationString({required String name}) async {
    var property = await localCtrlDataSource.getProperty(name);
    if (property == null) throw Exception("Property $name does not exist");

    return trim(latin1.decoder.convert(property.value));
  }

  // TODO check MAX_LENGTH according to firmware. (incl error in UI)
  Future _writeConfigurationString(
      {required String name, String? value}) async {
    var requiredValue = value?.isEmpty ?? true ? "" : value!;
    var data = latin1.encoder.convert("$requiredValue\x00");

    await localCtrlDataSource.setProperty(name, data);
  }

  Future _writeConfigurationInt({required String name, int? value}) async {
    var data = Uint8List(4)..buffer.asInt32List()[0] = value ?? 0;
    await localCtrlDataSource.setProperty(name, data);
  }

  @override
  Future<int> readConfigurationInt({required String name}) async {
    var property = await localCtrlDataSource.getProperty(name);
    if (property == null) throw Exception("Property $name does not exist");

    final byteList = ByteData.view(property.value.buffer);
    return byteList.getUint32(0, Endian.little);
  }

  static bool _isWifiADevice(final WiFiAccessPoint wifi) {
    return wifi.ssid.startsWith(DEFAULT_DEVICE_PREFIX);
  }

  @override
  Future reload() async {
    await localCtrlDataSource.reloadProperties();
  }

  String trim(String from) {
    var stringEnd = from.codeUnits.indexOf(0);
    return from.substring(0, stringEnd);
  }
}
