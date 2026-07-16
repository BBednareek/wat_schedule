// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_schedule_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayScheduleEntity _$DayScheduleEntityFromJson(Map<String, dynamic> json) =>
    _DayScheduleEntity(
      date: json['date'] as String,
      entries: (json['entries'] as List<dynamic>)
          .map((e) => ScheduleEntryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayScheduleEntityToJson(_DayScheduleEntity instance) =>
    <String, dynamic>{
      'date': instance.date,
      'entries': instance.entries,
    };
