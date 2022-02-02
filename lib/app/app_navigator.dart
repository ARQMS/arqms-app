import 'package:ARQMS/app/auth/auth_signin_page.dart';
import 'package:ARQMS/app/auth/auth_widget.dart';
import 'package:ARQMS/app/home/home_page.dart';
import 'package:ARQMS/styles/route_animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// coverage:ignore-file

/// A list of all possible routes in club management app.
enum Routes {
  roomDetail,
  deviceConfig,
  deviceSetup,
}

/// A private helper class for routing
@visibleForTesting
class Paths {
  // the default routing string if any error occurs
  static const String splash = '/';

  static const String roomDetail = '/room-detail';
  static const String deviceConfig = '/device-config';
  static const String deviceSetup = '/device-setup';

  // a map for routing
  static const Map<Routes, String> _pathMap = {
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
    var arguments = settings.arguments as Map<String, dynamic>?;
    var maintain = true;
    Widget? page;

    switch (settings.name) {
      case Paths.splash:
        page = const HomePage();
        break;

      case Paths.roomDetail:
        page = const HomePage();
        break;

      case Paths.deviceConfig:
      case Paths.deviceSetup:
    }

    if (page == null) {
      if (!kDebugMode) {
        return _pageRoute(const HomePage());
      } else {
        return MaterialPageRoute(
            builder: (_) =>
                Text("Not '" + settings.name.toString() + "' implemented yet"),
            settings: settings);
      }
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
