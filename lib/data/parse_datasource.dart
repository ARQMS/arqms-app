import 'dart:async';

import 'package:ARQMS/models/auth/user.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

/// Parse remote data source
abstract class ParseDataSource {
  /// sign in with given username and password, returns the user model or throw
  /// an [ApiFailure]
  Future signIn(
    final String email,
    final String password,
  );

  /// sign in with google account, returns the user model or throw
  /// an [ApiFailure]
  Future signInWithGoogle(GoogleSignInAccount? credentials);

  /// Sign out current user
  Future signOut();

  /// Notifies about changes to the user's sign-in state
  Stream<User?> authStateChanges();
}

class ParseDataSourceImpl implements ParseDataSource {
  ParseDataSourceImpl() {
    _init();
  }

  void _init() async {
    const connectionString = "http://root:root@localhost:1337/parse";
    await Parse().initialize(
      "arqms",
      connectionString,
      debug: kDebugMode,
      autoSendSessionId: true,
    );

    // TODO load user data from cache or local storage
    authState.add(null);
  }

  @override
  Future signIn(String email, String password) async {
    var user = ParseUser(email, password, email);
    var response = await user.login();

    if (!response.success) {
      return authState.addError(response.error!);
    }

    authState.add(User.fromJson(user.toJson()));
  }

  @override
  Future signInWithGoogle(GoogleSignInAccount? credentials) async {
    final authentication = await credentials?.authentication;
    final response = await ParseUser.loginWith(
      'google',
      <String, dynamic>{
        'access_token': authentication?.accessToken,
        'id': credentials?.id,
        'id_token': authentication?.idToken
      },
      username: credentials?.email,
      email: credentials?.email,
    );

    if (!response.success) {
      return authState.addError(response.error!);
    }

    var user = await ParseUser.currentUser() as ParseUser;
    authState.add(User.fromJson(user.toJson()));
  }

  @override
  Future signOut() async {
    authState.add(null);
  }

  @override
  Stream<User?> authStateChanges() {
    return authState.stream;
  }

  final StreamController<User?> authState = StreamController();
}
