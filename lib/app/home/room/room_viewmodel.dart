import 'package:ARQMS/models/room/room.dart';
import 'package:ARQMS/services/room_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class RoomViewModel with ChangeNotifier {
  final RoomService _roomService;

  RoomViewModel({required RoomService roomService})
      : _roomService = roomService;

  QueryBuilder<Room> get getRoomsQuery => _roomService.getRoomsQuery;

  Future delete(Room room) async {}

  void gotoDetails(Room room) {}

  void addRoom() {}
}
