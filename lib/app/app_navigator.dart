import 'package:ARQMS/app/auth/auth_signin_page.dart';
import 'package:ARQMS/app/home/home_page.dart';
import 'package:ARQMS/app/home/room/room_page.dart';
import 'package:ARQMS/app/setup/setup_page.dart';
import 'package:ARQMS/styles/route_animations.dart';
import 'package:ARQMS/widgets/auth_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// coverage:ignore-file

/// A list of all possible routes in club management app.
enum Routes {
  home,
  roomDetail,
  deviceConfig,
  deviceSetup,
}

/// A private helper class for routing
@visibleForTesting
class Paths {
  // the default routing string if any error occurs
  static const String splash = '/';
  static const String home = splash;

  static const String roomDetail = '/room-detail';
  static const String deviceConfig = '/device-config';
  static const String deviceSetup = '/device-setup';

  // a map for routing
  static const Map<Routes, String> _pathMap = {
    Routes.home: Paths.home,
    Routes.roomDetail: Paths.roomDetail,
    Routes.deviceConfig: Paths.deviceConfig,
    Routes.deviceSetup: Paths.deviceSetup,
  };

  /// a mapper function to convert route to string.
  ///
  /// Return given routing string.
  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  /// gets the unique navigator state
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// gets the navigation state
  static NavigatorState? get state => _navigatorKey.currentState;

  /// Pushes the new page on top of Navigator. To go back use [pop]
  static Future push<T>(Routes route, [T? arguments]) async =>
      await state?.pushNamed(Paths.of(route), arguments: arguments);

  /// Replace current frame with new page
  static Future replaceWith<T>(Routes route, [T? arguments]) async =>
      await state?.pushReplacementNamed(Paths.of(route), arguments: arguments);

  /// Removes the top-most route and go back.
  static void pop() => state?.pop();

  /// initializes transition for routing
  static Route? onGenerateRoute(RouteSettings settings) {
    Widget? page;

    switch (settings.name) {
      case Paths.home:
      case Paths.splash:
        page = const RoomPage();
        break;

      case Paths.deviceSetup:
        page = SetupPage();
        break;

      case Paths.roomDetail:

      default:
        if (kDebugMode) {
          return MaterialPageRoute(
            builder: (_) =>
                Text("Not '" + settings.name.toString() + "' implemented yet"),
            settings: settings,
          );
        }
        page = const HomePage();
        break;
    }

    return _pageRoute(page);
  }

  static Route _pageRoute(Widget page) => SlideRoute(
        page: AuthWidget(
          signedInBuilder: (_) => page,
          nonSignedInBuilder: (_) => const SignInPage(),
        ),
      );

  // private members
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
}
