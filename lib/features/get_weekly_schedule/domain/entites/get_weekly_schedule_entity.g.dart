// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_weekly_schedule_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleEntity _$ScheduleEntityFromJson(Map<String, dynamic> json) =>
    _ScheduleEntity(
      schedule: (json['schedule'] as List<dynamic>)
          .map((e) => DayScheduleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleEntityToJson(_ScheduleEntity instance) =>
    <String, dynamic>{
      'schedule': instance.schedule,
    };
