import 'package:ARQMS/app/app_navigator.dart';
import 'package:ARQMS/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final AuthService _authService;

  HomeViewModel({required AuthService authService})
      : _authService = authService;

  // TODO https://pub.dev/packages/package_info_plus
  String get versionInfo => "x.x.x";

  void signOut() {
    _authService.signOut();
  }

  void gotoRoom() async {
    await AppNavigator.replaceWith(Routes.home);
  }
}
