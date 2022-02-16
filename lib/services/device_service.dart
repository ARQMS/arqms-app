import 'package:ARQMS/models/device/device.dart';

abstract class DeviceService {
  Future<List<Device>> broadcast(Duration duration);

  Future setup(
    Device device, {
    String? deviceName,
    int? interval,
    String? brokerUri,
    String? ssid,
    String? ssidPwd,
  });

  void cancelBroadcast();
}

class DeviceServiceImpl implements DeviceService {
  @override
  Future setup(Device device,
      {String? deviceName,
      int? interval,
      String? brokerUri,
      String? ssid,
      String? ssidPwd}) async {
    // 1) send configuration name, ssid, pwd, uri etc
    // 2) receive device information like serialnumber
    // 3) register serialnumber with current logged in account
    // 4) swap back to previous wlan
  }

  @override
  Future<List<Device>> broadcast(Duration duration) async {
    // TODO store current wlan connection

    // TODO: implement startBroadcast
    await Future.delayed(const Duration(seconds: 2));

    return [Device()];
  }

  @override
  void cancelBroadcast() {
    // TODO stop broadcast
    // TODO reconnect to wlan connection
  }
}
