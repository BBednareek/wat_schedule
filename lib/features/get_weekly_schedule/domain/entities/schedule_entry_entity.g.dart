// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_entry_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleEntryEntity _$ScheduleEntryEntityFromJson(Map<String, dynamic> json) =>
    _ScheduleEntryEntity(
      raw: json['raw'] as String,
      subject: json['subject'] as String?,
      type: $enumDecodeNullable(_$EntryTypeEnumMap, json['type']),
      room: json['room'] as String?,
      building: json['building'] as String?,
      blockRaw: json['block_raw'] as String,
      blockTime: json['block_time'] as String,
    );

Map<String, dynamic> _$ScheduleEntryEntityToJson(
        _ScheduleEntryEntity instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'subject': instance.subject,
      'type': _$EntryTypeEnumMap[instance.type],
      'room': instance.room,
      'building': instance.building,
      'block_raw': instance.blockRaw,
      'block_time': instance.blockTime,
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
