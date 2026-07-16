// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/day_schedule_entity.dart';

part 'weekly_schedule_entity.freezed.dart';
part 'weekly_schedule_entity.g.dart';

/// Represents a weekly schedule, which is a collection of daily schedule.
/// Each day in the week is represented by a `DayScheduleEntity` object.
/// This entity is used to manage and display the entire weekly schedule in the application.
/// The `days` field is a list of `DayScheduleEntity` objects,
/// where each object contains the date and a list of entries for that day.
@freezed
abstract class WeeklyScheduleEntity with _$WeeklyScheduleEntity {
  factory WeeklyScheduleEntity({
    @JsonKey(name: 'schedule') required List<DayScheduleEntity> days,
  }) = _WeeklyScheduleEntity;

  factory WeeklyScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$WeeklyScheduleEntityFromJson(json);
}
