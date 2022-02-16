import 'dart:async';

import 'package:ARQMS/data/exception_datasource.dart';
import 'package:ARQMS/models/auth/user.dart';
import 'package:ARQMS/models/room/room.dart';
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
    const connectionString = "http://root:root@192.168.0.16:1337/parse";
    await Parse().initialize("arqms", connectionString,
        debug: kDebugMode,
        autoSendSessionId: true,
        liveQueryUrl: "ws://192.168.0.16:1337/parse",
        parseUserConstructor: (username, password, emailAddress,
                {client, debug, sessionToken}) =>
            User(username, password, emailAddress),
        registeredSubClassMap: <String, ParseObjectConstructor>{
          Room.tabelleName: () => Room(),
        });
  }

  @override
  Future<User?> signIn(String email, String password) async {
    var user = User(email, password, email);
    var response = await user.login();

    if (!response.success) {
      throw DataSourceException.fromParse(response.error!);
    }

    return user;
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

    return response.result as User?;
  }

  @override
  Future<User?> signInSilent([GoogleSignInAccount? credentials]) async {
    if (credentials == null) {
      return await ParseUser.currentUser() as User?;
    }

    return signInWithGoogle(credentials);
  }

  @override
  Future<bool> signOut() async {
    var user = await ParseUser.currentUser() as User;
    var response = await user.logout();

    if (!response.success) {
      throw DataSourceException.fromParse(response.error!);
    }
    return true;
  }
}
