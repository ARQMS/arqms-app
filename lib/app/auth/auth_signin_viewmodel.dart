import 'dart:async';

import 'package:ARQMS/data/exception_datasource.dart';
import 'package:ARQMS/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInViewModel with ChangeNotifier {
  final AuthService _authService;

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  String? lastError = null;

  /// Constructor
  SignInViewModel({required AuthService authService})
      : _authService = authService;

  Future signIn(GlobalKey<FormState> formKey) async {
    var valid = formKey.currentState!.validate();
    if (!valid) return;

    formKey.currentState!.save();

    _setLoading(true);
    try {
      await _authService.signIn(username.text, password.text);
    } on DataSourceException catch (e) {
      lastError = e.message;
    } finally {
      _setLoading(false);
    }
  }

  void forgetPassword() {
    // TODO
  }

  Future signInGoogle() async {
    _setLoading(true);

    try {
      await _authService.signInWithGoogle();
    } on DataSourceException catch (e) {
      lastError = e.message;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }
}
