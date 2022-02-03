import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// This is a data source for connection to google services.
///
/// Ensure your developer google account has been registered in the google backend
/// https://stackoverflow.com/a/56216730+
/// https://pub.dev/packages/google_sign_in_web
abstract class GoogleDataSource {
  /// Sign in process with extern google sign in process
  /// [force] will disconnect the account and enforce a new sign in otherwise
  /// a still existing cached account could be taken without any user input
  Future<GoogleSignInAccount?> signIn({bool force = false});

  /// Try to sign in silent
  Future<GoogleSignInAccount?> signInSilent();

  /// Sign out current user
  Future<bool> signOut();
}

class GoogleDataSourceImpl extends GoogleDataSource {
  /// Google API scopes
  /// https://developers.google.com/calendar/api/guides/auth
  static const _scopes = <String>[];

  final GoogleSignIn _googleService = GoogleSignIn.standard(scopes: _scopes);

  @override
  Future<GoogleSignInAccount?> signInSilent() async {
    return await _googleService.signInSilently();
  }

  @override
  Future<GoogleSignInAccount?> signIn({bool force = false}) async {
    if (force) {
      await _googleService.disconnect();
    }
    try {
      return await _googleService.signIn();
    } on PlatformException catch (e) {
      if (e.code == "popup_closed_by_user") {
        // nothing to do
        return null;
      }
      rethrow;
    }
  }

  @override
  Future<bool> signOut() async {
    final isSignedIn = await _googleService.isSignedIn();
    if (isSignedIn) {
      await _googleService.disconnect();
      await _googleService.signOut();
    }

    return true;
  }
}
