// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['objectId', 'name'],
  );
  return Room(
    objectId: json['objectId'] as String,
    name: json['name'] as String,
    state: $enumDecodeNullable(_$RoomStateEnumMap, json['state']),
    temperature: (json['temperature'] as num?)?.toDouble(),
    relativeHumidity: (json['relativeHumidity'] as num?)?.toDouble(),
    co2: (json['co2'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) {
  final val = <String, dynamic>{
    'objectId': instance.objectId,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', _$RoomStateEnumMap[instance.state]);
  writeNotNull('temperature', instance.temperature);
  writeNotNull('relativeHumidity', instance.relativeHumidity);
  writeNotNull('co2', instance.co2);
  return val;
}

const _$RoomStateEnumMap = {
  RoomState.GOOD: 'GOOD',
  RoomState.POOR: 'POOR',
  RoomState.MODERATE: 'MODERATE',
};
