import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

///Represents a history snapshot of a room.
class RoomHistory extends ParseObject implements ParseCloneable {
  RoomHistory() : super(tabelleName);
  RoomHistory.clone() : this();

  @override
  clone(Map<String, dynamic> map) => RoomHistory.clone()..fromJson(map);

  static const String tabelleName = "RoomHistory";
  static const String keyRoom = "room";
  static const String keyPressure = "pressure";
  static const String keyDate = "createdAt";
  static const String keyVoc = "voc";
  static const String keyTemperature = "temperature";
  static const String keyRelativeHumidity = "relativeHumidity";
  static const String keyCo2 = "co2";

  DateTime? get createdAt => get<DateTime>(keyDate);

  num get voc => get<num>(keyVoc) ?? 0;
  set voc(num val) => set<num?>(keyVoc, val);

  num get temperature => get<num>(keyTemperature) ?? 0;
  set temperature(num? val) => set<num?>(keyTemperature, val);

  num get pressure => get<num>(keyPressure) ?? 0;
  set pressure(num? val) => set<num?>(keyPressure, val);

  num get relativeHumidity => get<num?>(keyRelativeHumidity) ?? 0;
  set relativeHumidity(num? val) => set<num?>(keyRelativeHumidity, val);

  num get co2 => get<num>(keyCo2) ?? 0;
  set co2(num? val) => set<num?>(keyCo2, val);
}
