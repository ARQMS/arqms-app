import 'package:ARQMS/data/google_datasource.dart';
import 'package:ARQMS/data/parse_datasource.dart';
import 'package:ARQMS/models/auth/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// coverage:ignore-file

// according to riverpod best practice, the providers declarations shall be
// global variables.

final parseProvider = Provider<ParseDataSource>(
  (ref) => ParseDataSourceImpl(),
);

final googleProvider = Provider<GoogleDataSource>(
  (ref) => GoogleDataSourceImpl(),
);

final authStateChangesProvider = StreamProvider<User?>(
  (ref) => ref.watch(parseProvider).authStateChanges(),
);
