import 'dart:async';

import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/data/parse_datasource.dart';
import 'package:ARQMS/models/room/room.dart';
import 'package:ARQMS/models/room/room_history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

final roomDetailsProvider = StreamProvider<List<RoomHistory>?>(
  (ref) => ref.read(roomService).getRoomHistory,
);

abstract class RoomService {
  QueryBuilder<Room> get getRoomsQuery;

  Stream<List<RoomHistory>> get getRoomHistory;

  Future<void> loadRoomDetails(
    String roomId, {
    required DateTime start,
    required DateTime end,
  });
}

class RoomServiceImpl implements RoomService {
  final ParseDataSource _parseSource;
  final StreamController<List<RoomHistory>> _streamCtrlRoomHistory;

  @override
  QueryBuilder<Room> get getRoomsQuery => QueryBuilder.name(Room.tabelleName);

  Stream<List<RoomHistory>> get getRoomHistory => _streamCtrlRoomHistory.stream;

  RoomServiceImpl({
    required ParseDataSource parseSource,
  })  : _parseSource = parseSource,
        _streamCtrlRoomHistory = StreamController<List<RoomHistory>>();

  @override
  Future<void> loadRoomDetails(
    String roomId, {
    required DateTime start,
    required DateTime end,
  }) async {
    List<RoomHistory> history =
        await _parseSource.getRoomHistory(roomId, start: start, end: end);

    _streamCtrlRoomHistory.add(history);
  }
}
