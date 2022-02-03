import 'package:ARQMS/data/parse_datasource.dart';
import 'package:ARQMS/models/room/room.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class RoomService {
  QueryBuilder<Room> get getRoomsQuery;
}

class RoomServiceImpl implements RoomService {
  final ParseDataSource _parseSource;

  @override
  QueryBuilder<Room> get getRoomsQuery => QueryBuilder.name(Room.tabelleName);

  RoomServiceImpl({
    required ParseDataSource parseSource,
  }) : _parseSource = parseSource;
}
