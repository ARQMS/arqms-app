import 'package:ARQMS/models/room/room_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

///Represents a single room. Each room corresponding to one device
@JsonSerializable(explicitToJson: true)
class Room {
  ///A unique id for database
  @JsonKey(name: 'objectId', required: true, includeIfNull: false)
  final String objectId;
  ///The room display name
  @JsonKey(name: 'name', required: true, includeIfNull: false)
  final String name;
  ///The room quality state
  @JsonKey(name: 'state', includeIfNull: false)
  final RoomState? state;
  ///The current room temperature [C]
  @JsonKey(name: 'temperature', includeIfNull: false)
  final double? temperature;
  ///The current room humidity in [%]
  @JsonKey(name: 'relativeHumidity', includeIfNull: false)
  final double? relativeHumidity;
  ///The current room co2 in [%]
  @JsonKey(name: 'co2', includeIfNull: false)
  final double? co2;

  const Room({
    required this.objectId,
    required this.name,
    this.state,
    this.temperature,
    this.relativeHumidity,
    this.co2,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Room &&
          runtimeType == other.runtimeType &&
          objectId == other.objectId &&
          name == other.name &&
          state == other.state &&
          temperature == other.temperature &&
          relativeHumidity == other.relativeHumidity &&
          co2 == other.co2;

  @override
  int get hashCode =>
      objectId.hashCode ^
      name.hashCode ^
      state.hashCode ^
      temperature.hashCode ^
      relativeHumidity.hashCode ^
      co2.hashCode;

  @override
  String toString() =>
      'Room{'
      'objectId: $objectId, '
      'name: $name, '
      'state: $state, '
      'temperature: $temperature, '
      'relativeHumidity: $relativeHumidity, '
      'co2: $co2'
      '}';

}
