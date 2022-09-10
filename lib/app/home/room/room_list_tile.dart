import 'package:ARQMS/models/room/room.dart';
import 'package:ARQMS/models/room/room_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              _buildTitle(context),
              _buildValues(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.only(left: 10, bottom: 10),
        title: Text(
          room.name ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat.yMd().add_Hm().format(room.updatedAt!),
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      );

  Widget _buildValues(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildSensorValue(
              icon: Icons.thermostat,
              titleId: "room.sensor.temp.title",
              value: "${room.temperature.toStringAsFixed(1)} °C",
            ),
            _buildSensorValue(
              icon: Icons.opacity,
              titleId: "room.sensor.humidity.title",
              value: "${room.relativeHumidity.toStringAsFixed(1)} % rH",
            ),
            _buildSensorValue(
              icon: Icons.cloud,
              titleId: "room.sensor.co2.title",
              value: "${room.co2.toStringAsFixed(1)} %",
            ),
          ],
        ),
      );

  Widget _buildSensorValue(
          {required String titleId,
          required String value,
          required IconData icon}) =>
      Row(children: [
        Icon(icon),
        Text(value, style: const TextStyle(fontSize: 26)),
      ]);

  static Color _stateToColor(RoomState? state) {
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
