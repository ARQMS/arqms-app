import 'package:ARQMS/app/app_navigator.dart';
import 'package:ARQMS/main.dart';
import 'package:ARQMS/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final AuthService _authService;

  HomeViewModel({required AuthService authService})
      : _authService = authService;

  String get versionInfo => "${appInfo.version}+${appInfo.buildNumber}";

  void signOut() {
    _authService.signOut();
  }

  void gotoRoom() async {
    await AppNavigator.replaceWith(Routes.home);
  }
}
