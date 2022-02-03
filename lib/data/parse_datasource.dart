import 'dart:async';

import 'package:ARQMS/data/exception_datasource.dart';
import 'package:ARQMS/models/auth/user.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

/// Parse remote data source
abstract class ParseDataSource {
  /// sign in with given username and password, returns the user model or throw
  /// an [ApiFailure]
  Future<User?> signIn(
    final String email,
    final String password,
  );

  /// sign in with google account, returns the user model or throw
  /// an [ApiFailure]
  Future<User?> signInWithGoogle(GoogleSignInAccount? credentials);

  /// try to sign in silent. If a user is cached, reuse them. Use the
  /// [credentials] for google account, when null try parse cache
  Future<User?> signInSilent([GoogleSignInAccount? credentials]);

  /// Sign out current user
  Future<bool> signOut();
}

class ParseDataSourceImpl implements ParseDataSource {
  void initialize() async {
    const connectionString = "http://root:root@localhost:1337/parse";
    await Parse().initialize(
      "arqms",
      connectionString,
      debug: kDebugMode,
      autoSendSessionId: true,
      liveQueryUrl: "ws://localhost:1337/parse",
    );
  }

  @override
  Future<User?> signIn(String email, String password) async {
    var user = ParseUser(email, password, email);
    var response = await user.login();

    if (!response.success) {
      throw DataSourceException.fromParse(response.error!);
    }

    return User.fromJson(user.toJson());
  }

  @override
  Future<User?> signInWithGoogle(GoogleSignInAccount? credentials) async {
    if (credentials == null) return null;

    final authentication = await credentials.authentication;
    final response = await ParseUser.loginWith(
      'google',
      <String, dynamic>{
        'access_token': authentication.accessToken,
        'id': credentials.id,
        'id_token': authentication.idToken
      },
      username: credentials.email,
      email: credentials.email,
    );

    if (!response.success) {
      throw DataSourceException.fromParse(response.error!);
    }

    var user = response.result as ParseUser?;
    if (user == null) return null;

    return User.fromJson(user.toJson());
  }

  @override
  Future<User?> signInSilent([GoogleSignInAccount? credentials]) async {
    if (credentials == null) {
      var user = await ParseUser.currentUser() as ParseUser?;
      if (user == null) return null;

      return User.fromJson(user.toJson());
    }

    return signInWithGoogle(credentials);
  }

  @override
  Future<bool> signOut() async {
    var user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();

    if (!response.success) {
      throw DataSourceException.fromParse(response.error!);
    }
    return true;
  }
}
