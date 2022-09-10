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

  num get temperature => get<num>(keyTemperature) ?? 0;
  set temperature(num? val) => set<num?>(keyTemperature, val);

  num get relativeHumidity => get<num?>(keyRelativeHumidity) ?? 0;
  set relativeHumidity(num? val) => set<num?>(keyRelativeHumidity, val);

  num get co2 => get<num>(keyCo2) ?? 0;
  set co2(num? val) => set<num?>(keyCo2, val);
}
