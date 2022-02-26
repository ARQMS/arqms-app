import 'package:wifi_scan/wifi_scan.dart';

class Device {
  final WiFiAccessPoint _accessPoint;

  String get ssid => _accessPoint.ssid;
  String get bssid => _accessPoint.bssid;
  int get signalStrength => _accessPoint.level;

  Device(WiFiAccessPoint accessPoint) : _accessPoint = accessPoint;
}
