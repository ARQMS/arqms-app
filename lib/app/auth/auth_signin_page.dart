import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/app/auth/auth_signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_button.dart';

final _signInModelProvider = ChangeNotifierProvider<SignInViewModel>(
  (ref) => SignInViewModel(
    authService: ref.read(authService),
  ),
);

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AuthSignInState();
}

class AuthSignInState extends ConsumerState<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _focusEmailNode = FocusNode();
  final _focusPasswordNode = FocusNode();

  // https://stackoverflow.com/a/16888554/7110375
  static final _emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final viewModel = ref.watch(_signInModelProvider);

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _title,
              viewModel.isLoading ? _wait : _signIn(viewModel)
            ],
          ),
        ),
      ),
    );
  }

  Widget get _title => Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Text(
          "title".i18n(context),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 22.0,
          ),
        ),
      );

  Widget _signIn(SignInViewModel viewModel) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: viewModel.username,
            focusNode: _focusEmailNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_focusPasswordNode);
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (val) {
              if (val == null || !_emailRegex.hasMatch(val)) {
                return "auth.email.error".i18n(context);
              }
            },
            decoration: InputDecoration(
              isDense: true,
              labelText: "auth.email".i18n(context),
              hintText: "auth.email.hint".i18n(context),
            ),
          ),
          TextFormField(
            controller: viewModel.password,
            focusNode: _focusPasswordNode,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            textInputAction: TextInputAction.go,
            onFieldSubmitted: (value) => viewModel.signIn(_formKey),
            validator: (value) {
              if (value?.isNotEmpty == false) {
                return "auth.password.error".i18n(context);
              }
            },
            decoration: InputDecoration(
              labelText: "auth.password".i18n(context),
              hintText: "auth.password.hint".i18n(context),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Coming soon"))),
              viewModel.forgetPassword()
            },
            child: Text(
              "auth.password.forget".i18n(context),
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 50),
          AuthButton(
            textId: "auth.signIn",
            onTab: () => viewModel.signIn(_formKey),
          ),
          if (viewModel.lastError != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                viewModel.lastError!,
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
            ),
          const Divider(height: 50),
          AuthProviderButton(
            textId: "auth.signIn.google",
            onTab: viewModel.signInGoogle,
            icon: const Image(
                image: AssetImage("assets/google-logo.png"),
                height: 18.0,
                width: 18.0),
          )
        ],
      ),
    );
  }

  Widget get _wait => const CircularProgressIndicator();

  @override
  void dispose() {
    super.dispose();

    _focusEmailNode.dispose();
    _focusPasswordNode.dispose();
  }
}
