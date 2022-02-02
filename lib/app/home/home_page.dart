import 'package:ARQMS/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(parseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      body: ElevatedButton(
        onPressed: () => {authProvider.signOut()},
        child: const Text("Signout"),
      ),
    );
  }
}
