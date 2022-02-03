import 'package:ARQMS/app/app_instantiation.dart';
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

    return ParseLiveListWidget<ParseObject>(
      query: viewModel.getRoomsQuery,
      lazyLoading: false,
      childBuilder: (BuildContext context,
          ParseLiveListElementSnapshot<ParseObject> snapshot) {
        if (!snapshot.hasData) return Text("Failure");

        final room = Room.fromJson(snapshot.loadedData!.toJson());

        return RoomListTile(
          room: room,
          onTap: () => viewModel.gotoDetails(room),
        );
      },
    );

    /* ListItemsBuilder<Room>(
        data: roomAsyncValue,
        itemBuilder: (context, room) => Dismissible(
              key: Key(room.objectId),
              background: Container(
                color: Colors.red,
                child: const Icon(Icons.remove),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => viewModel.delete(room),
              child: RoomListTile(
                room: room,
                onTap: () => viewModel.gotoDetails(room),
              ),
            ));*/
  }
}
