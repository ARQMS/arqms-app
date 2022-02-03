import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/app/home/home_drawer.dart';
import 'package:ARQMS/app/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeModelProvider = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(
    authService: ref.read(authService),
  ),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  // Room page is currently to only page, so we forward it directly. In future, we must replace the content
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      drawer: const HomeDrawer(),
      body: const Text("Not implemented yet!"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
