import 'package:ARQMS/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final AuthService _authService;

  HomeViewModel({required AuthService authService})
      : _authService = authService;

  void signOut() {
    _authService.signOut();
  }
}
