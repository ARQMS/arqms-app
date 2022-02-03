import 'package:ARQMS/models/room/room_state.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

///Represents a single room. Each room corresponding to one device
class Room extends ParseObject implements ParseCloneable {
  Room() : super(tabelleName);
  Room.clone() : this();

  @override
  clone(Map<String, dynamic> map) => Room.clone()..fromJson(map);

  static const String tabelleName = "Room";
  static const String keyName = "name";
  static const String keyState = "state";
  static const String keyTemperature = "temperature";
  static const String keyRelativeHumidity = "relativeHumidity";
  static const String keyCo2 = "co2";

  String? get name => get<String>(keyName);
  set name(String? val) => set<String?>(keyName, val);

  RoomState? get state => get<String>(keyState)?.asRoomState;
  set state(RoomState? val) => set<String?>(keyState, val?.stringValue);

  double? get temperature => get<double>(keyTemperature);
  set temperature(double? val) => set<double?>(keyTemperature, val);

  double? get relativeHumidity => get<double>(keyRelativeHumidity);
  set relativeHumidity(double? val) => set<double?>(keyRelativeHumidity, val);

  double? get co2 => get<double>(keyCo2);
  set co2(double? val) => set<double?>(keyCo2, val);
}
