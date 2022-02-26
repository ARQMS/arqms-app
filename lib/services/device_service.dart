import 'dart:async';
import 'dart:math';

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

  void cancelBroadcast();
}

class DeviceServiceImpl implements DeviceService {
  final ParseDataSource parseDataSource;
  String? lastSSID;
  Completer<List<Device>>? deviceSearchCompletion;
  List<Device> devices = [];

  DeviceServiceImpl({required this.parseDataSource});

  @override
  Future<bool> setup(Device device,
      {String? roomName,
      int? interval,
      String? brokerUri,
      String? ssid,
      String? ssidPwd}) async {
    // 1) receive device information
    var serialNumber = await _readConfiguration(device, name: "SerialNumber");

    // 2) send configuration to device
    await _writeConfiguration(device, name: "Room", value: roomName);
    await _writeConfiguration(device, name: "SSID", value: ssid);
    await _writeConfiguration(device, name: "SSID_PWD", value: ssidPwd);
    await _writeConfiguration(device, name: "Interval", value: "$interval");
    await _writeConfiguration(device, name: "BrokerUri", value: brokerUri);

    // 3) swap back to previous wlan
    var currentSSID = await WiFiForIoTPlugin.getSSID();
    if (currentSSID != lastSSID && lastSSID != null) {
      await WiFiForIoTPlugin.removeWifiNetwork(currentSSID!);
      await WiFiForIoTPlugin.disconnect();

      // Just to be sure wifi switched back
      await Future.delayed(const Duration(seconds: 2));
      await WiFiForIoTPlugin.connect(lastSSID!);
      await Future.delayed(const Duration(seconds: 2));
    }

    // 4) register serialnumber with current logged in account
    return await parseDataSource.registerDevice(
      serialNumber: serialNumber,
    );
  }

  @override
  Future<List<Device>> broadcast(Duration duration) async {
    devices.clear();

    if (!await _checkPermissions()) {
      return devices;
    }

    // Ensure wifi is enabled
    if (!await WiFiForIoTPlugin.isEnabled()) {
      await WiFiForIoTPlugin.setEnabled(true);
    }

    // back up SSID when available to restore wlan after device registration
    if (await WiFiForIoTPlugin.isConnected()) {
      lastSSID = await WiFiForIoTPlugin.getSSID();
    }

    // start scan and wait for results
    await WiFiScan.instance.startScan();
    deviceSearchCompletion = Completer<List<Device>>();
    var wifiStream = WiFiScan.instance.onScannedResultsAvailable.listen(
      (results) {
        devices.addAll(
          results.where(_isWifiADevice).map((result) => Device(result)),
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

  @override
  Future<bool> connect(Device device) async {
    return await WiFiForIoTPlugin.findAndConnect(
      device.ssid,
      joinOnce: true,
      bssid: device.bssid,
      password: "AirRoom!2022",
    );
  }

  Future<String> _readConfiguration(
    Device device, {
    required String name,
  }) async {
    // TODO

    var rand = Random();
    var sn = rand.nextInt(1000000);
    var sn1 = sn ~/ 1000;
    var sn2 = sn % 1000;
    return Future.value("AR-$sn1-$sn2");
  }

  Future<String> _writeConfiguration(
    Device device, {
    required String name,
    String? value,
  }) async {
    // TODO
    return Future.value(name);
  }

  static bool _isWifiADevice(final WiFiAccessPoint wifi) {
    return wifi.ssid.startsWith("AR-");
  }

  static Future<bool> _checkPermissions() async {
    final canScan = await WiFiScan.instance.canStartScan(
      askPermissions: true,
    );
    final canResult = await WiFiScan.instance.canGetScannedResults(
      askPermissions: true,
    );

    return canScan == CanStartScan.yes && canResult == CanGetScannedResults.yes;
  }
}
