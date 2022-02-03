import 'package:ARQMS/models/auth/user.dart';
import 'package:ARQMS/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Auth Widget to decide if login screen or home screen shall be shown
class AuthWidget extends ConsumerWidget {
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder nonSignedInBuilder;

  /// Constructor
  ///
  /// Depends on current sign in state either [signedInBuilder] or
  /// [nonSignedInBuilder] is shown
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(userChangedProvider);
    return authStateChanges.when(
      data: (user) => _data(context, user),
      error: (err, __) => _error(context, err),
      loading: () => _loading(context),
    );
  }

  Widget _data(BuildContext context, User? user) {
    return user == null
        ? nonSignedInBuilder(context)
        : signedInBuilder(context);
  }

  Widget _loading(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _error(BuildContext context, Object err) {
    return Scaffold(
      body: Center(child: Text("Something went wrong. " + err.toString())),
    );
  }
}
