import 'dart:async';

import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/data/google_datasource.dart';
import 'package:ARQMS/data/parse_datasource.dart';
import 'package:ARQMS/models/auth/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userChangedProvider = StreamProvider<User?>(
  (ref) => ref.read(authService).authStateChanges,
);

abstract class AuthService {
  /// Notifies about changes to the user's sign-in state
  Stream<User?> get authStateChanges;

  /// sign in with given username and password, returns the user model or throw
  /// an [ApiFailure]
  Future<User?> signIn(
    final String email,
    final String password,
  );

  /// sign in with google account, returns the user model or throw
  /// an [ApiFailure]
  Future signInWithGoogle();

  /// Sign out current user
  Future signOut();
}

class AuthServiceImpl extends AuthService {
  final GoogleDataSource _googleSource;
  final ParseDataSource _parseSource;

  final StreamController<User?> _authState = StreamController();

  @override
  Stream<User?> get authStateChanges => _authState.stream;

  AuthServiceImpl({
    required ParseDataSource parseSource,
    required GoogleDataSource googleSource,
  })  : _googleSource = googleSource,
        _parseSource = parseSource;

  Future initialize() async {
    // try {
    //   var credentials = await _googleSource.signInSilent();
    //   var user = await _parseSource.signInSilent(credentials);

    //   _authState.add(user);
    // } on Exception catch (e) {
    // }

    _authState.add(null);
  }

  @override
  Future<User?> signIn(String email, String password) async {
    var user = await _parseSource.signIn(email, password);
    _authState.add(user);
  }

  @override
  Future signInWithGoogle() async {
    var credentials = await _googleSource.signIn();
    var user = await _parseSource.signInWithGoogle(credentials);

    _authState.add(user);
  }

  @override
  Future signOut() async {
    var parseResult = await _parseSource.signOut();
    var googleResult = await _googleSource.signOut();

    if (!parseResult || !googleResult) {
      _authState.addError(
        Exception("Credentials not cleaned up successfully. Unknown error"),
      );
    }
    _authState.add(null);
  }
}
