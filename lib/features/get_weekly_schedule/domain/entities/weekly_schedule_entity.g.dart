// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_schedule_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeeklyScheduleEntity _$WeeklyScheduleEntityFromJson(
        Map<String, dynamic> json) =>
    _WeeklyScheduleEntity(
      days: (json['schedule'] as List<dynamic>)
          .map((e) => DayScheduleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeeklyScheduleEntityToJson(
        _WeeklyScheduleEntity instance) =>
    <String, dynamic>{
      'schedule': instance.days,
    };
