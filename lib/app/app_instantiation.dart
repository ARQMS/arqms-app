import 'package:ARQMS/data/google_datasource.dart';
import 'package:ARQMS/data/parse_datasource.dart';
import 'package:ARQMS/services/auth_service.dart';
import 'package:ARQMS/services/room_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// according to riverpod best practice, the providers declarations shall be
// global variables.

// coverage:ignore-file

final authService = Provider<AuthService>(
  (ref) => AuthServiceImpl(
    googleSource: ref.read(_googleProvider),
    parseSource: ref.read(_parseProvider),
  )..initialize(),
);

final roomService = Provider<RoomService>(
  (ref) => RoomServiceImpl(parseSource: ref.read(_parseProvider)),
);

final _parseProvider = Provider<ParseDataSource>(
  (ref) => ParseDataSourceImpl()..initialize(),
);

final _googleProvider = Provider<GoogleDataSource>(
  (ref) => GoogleDataSourceImpl(),
);
