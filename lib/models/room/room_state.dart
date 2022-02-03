import 'package:json_annotation/json_annotation.dart';

enum RoomState {
  @JsonValue('GOOD')
  GOOD,
  @JsonValue('POOR')
  POOR,
  @JsonValue('MODERATE')
  MODERATE,
}

const RoomStateMapping = {
  RoomState.GOOD: 'GOOD',
  RoomState.POOR: 'POOR',
  RoomState.MODERATE: 'MODERATE',
};

const reverseRoomStateMapping = {
  'GOOD': RoomState.GOOD,
  'POOR': RoomState.POOR,
  'MODERATE': RoomState.MODERATE,
};

extension RoomStateExtension on RoomState {
  String get stringValue => RoomStateMapping[this]!;
}

extension RoomStateStringExtension on String {
  RoomState? get asRoomState => reverseRoomStateMapping[this];
}
