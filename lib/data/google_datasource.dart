import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

/// This is a data source for connection to google services.
///
/// Ensure your developer google account has been registered in the google backend
/// https://stackoverflow.com/a/56216730+
/// https://pub.dev/packages/google_sign_in_web
abstract class GoogleDataSource {
  /// Sign in process
  Future<GoogleSignInAccount?> signIn({bool disconnect = false});

  /// Sign out current user
  Future<void> signOut();
}

class GoogleDataSourceImpl extends GoogleDataSource {
  /// Google API scopes
  /// https://developers.google.com/calendar/api/guides/auth
  static const _scopes = <String>[];

  final GoogleSignIn googleService = GoogleSignIn.standard(scopes: _scopes);

  AuthClient? _client;

  @override
  Future<GoogleSignInAccount?> signIn({bool disconnect = false}) async {
    if (disconnect) {
      await googleService.disconnect();
    }
    return await googleService.signIn();
  }

  @override
  Future<void> signOut() async {
    await googleService.signOut();
  }
}
