import 'package:ARQMS/data/parse_datasource.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class RoomService {
  QueryBuilder<ParseObject> get getRoomsQuery;
}

class RoomServiceImpl implements RoomService {
  final ParseDataSource _parseSource;

  @override
  QueryBuilder<ParseObject> get getRoomsQuery => QueryBuilder.name("Room");

  RoomServiceImpl({
    required ParseDataSource parseSource,
  }) : _parseSource = parseSource;
}
