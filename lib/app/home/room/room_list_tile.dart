import 'package:ARQMS/models/room/room.dart';
import 'package:ARQMS/models/room/room_state.dart';
import 'package:flutter/material.dart';

class RoomListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Room room;

  const RoomListTile({Key? key, required this.room, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 20,
                color: _stateToColor(room.state),
              ),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 10, bottom: 10),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("Delete room"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Configure Device"),
                      value: 2,
                    )
                  ],
                ),
                title: Text(
                  room.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  room.objectId,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat),
                      Text(
                        "${room.temperature?.toStringAsFixed(1)} °C",
                        style: TextStyle(fontSize: 26),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.opacity),
                      Text(
                        "${room.relativeHumidity?.toStringAsFixed(1)} %",
                        style: TextStyle(fontSize: 26),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.cloud),
                      Text(
                        "${room.co2?.toStringAsFixed(1)} %",
                        style: TextStyle(fontSize: 26),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _stateToColor(RoomState? state) {
    switch (state) {
      case RoomState.GOOD:
        return Colors.green;
      case RoomState.POOR:
        return Colors.red;
      case RoomState.MODERATE:
        return Colors.orange;
      default:
        return Colors.transparent;
    }
  }
}
