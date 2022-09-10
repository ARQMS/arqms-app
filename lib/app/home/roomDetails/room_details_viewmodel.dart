import 'package:ARQMS/app/app_navigator.dart';
import 'package:ARQMS/models/room/room_history.dart';
import 'package:ARQMS/services/room_service.dart';
import 'package:flutter/cupertino.dart';

class RoomDetailsViewModel with ChangeNotifier {
  final RoomService _roomService;

  Stream<List<RoomHistory>> get historyValues => _roomService.getRoomHistory;

  RoomDetailsViewModel({required RoomService roomService})
      : _roomService = roomService;

  void onBack() {
    AppNavigator.pop();
  }

  void loadRoom(String roomId) async {
    var end = DateTime.now().toUtc();
    var start = end.subtract(const Duration(days: 7));
    await _roomService.loadRoomDetails(roomId, end: end, start: start);
  }
}
