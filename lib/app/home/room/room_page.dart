import 'package:ARQMS/app/app_instantiation.dart';
import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/app/home/home_drawer.dart';
import 'package:ARQMS/app/home/room/room_list_tile.dart';
import 'package:ARQMS/app/home/room/room_viewmodel.dart';
import 'package:ARQMS/models/room/room.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

final roomModelProvider = ChangeNotifierProvider<RoomViewModel>(
  (ref) => RoomViewModel(roomService: ref.read(roomService)),
);

class RoomPage extends ConsumerWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(roomModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("room.title".i18n(context)),
      ),
      drawer: const HomeDrawer(),
      body: _buildContent(viewModel),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: viewModel.addRoom,
      ),
    );
  }

  Widget _buildContent(RoomViewModel viewModel) {
    return ParseLiveListWidget<Room>(
      query: viewModel.getRoomsQuery,
      lazyLoading: false,
      childBuilder:
          (BuildContext context, ParseLiveListElementSnapshot<Room> snapshot) {
        if (!snapshot.hasData) return Text("room.failure".i18n(context));

        final room = snapshot.loadedData!;

        return RoomListTile(
          room: room,
          onTap: () => viewModel.gotoDetails(room),
        );
      },
    );
  }
}
