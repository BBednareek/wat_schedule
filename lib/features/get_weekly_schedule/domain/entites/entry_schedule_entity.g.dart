// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_schedule_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntryEntity _$EntryEntityFromJson(Map<String, dynamic> json) => _EntryEntity(
      raw: json['raw'] as String,
      subject: json['subject'] as String?,
      type: $enumDecodeNullable(_$EntryTypeEnumMap, json['type']),
      room: json['room'] as String?,
      building: json['building'] as String?,
      block_raw: json['block_raw'] as String,
      block_time: json['block_time'] as String,
    );

Map<String, dynamic> _$EntryEntityToJson(_EntryEntity instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'subject': instance.subject,
      'type': _$EntryTypeEnumMap[instance.type],
      'room': instance.room,
      'building': instance.building,
      'block_raw': instance.block_raw,
      'block_time': instance.block_time,
    };

const _$EntryTypeEnumMap = {
  EntryType.c: 'ć',
  EntryType.l: 'L',
  EntryType.r: 'r',
  EntryType.w: 'w',
  EntryType.E: 'E',
  EntryType.Ep: 'Ep',
  EntryType.Zp: 'Zp',
  EntryType.Zal: 'Zal',
  EntryType.Inne: 'Inne',
  EntryType.unknown: 'unknown',
};
