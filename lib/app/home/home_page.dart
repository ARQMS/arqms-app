import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/app/home/home_drawer.dart';
import 'package:ARQMS/app/home/home_viewmodel.dart';
import 'package:ARQMS/app/home/room/room_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeModelProvider = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(
    authService: ref.read(authService),
  ),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
      ),
      drawer: const HomeDrawer(),
      // Room page is currently to only page, so we forward it directly. In future, we must replace the content
      body: const RoomPage(),
    );
  }
}
