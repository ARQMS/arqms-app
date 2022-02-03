import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/app/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _homeModelProvider = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(
    authService: ref.read(authService),
  ),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(_homeModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      body: ElevatedButton(
        onPressed: viewModel.signOut,
        child: const Text("Signout"),
      ),
    );
  }
}
