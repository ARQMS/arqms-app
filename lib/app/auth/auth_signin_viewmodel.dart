import 'package:ARQMS/data/google_datasource.dart';
import 'package:ARQMS/data/parse_datasource.dart';
import 'package:flutter/material.dart';

class SignInViewModel with ChangeNotifier {
  final ParseDataSource parseProvider;
  final GoogleDataSource googleProvider;

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  SignInViewModel({required this.parseProvider, required this.googleProvider});

  Future signIn(GlobalKey<FormState> formKey) async {
    var valid = formKey.currentState!.validate();
    if (!valid) return;

    formKey.currentState!.save();

    _setLoading(true);

    try {
      await parseProvider.signIn(username.text, password.text);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  void forgetPassword() {}

  Future signInGoogle() async {
    _setLoading(true);

    try {
      var credentials = await googleProvider.signIn();
      await parseProvider.signInWithGoogle(credentials);
    } finally {
      _setLoading(false);
    }
  }

  bool isLoading = false;
}
