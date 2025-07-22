import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/daily_schedule_entity.dart';

part 'get_weekly_schedule_entity.freezed.dart';
part 'get_weekly_schedule_entity.g.dart';

/// Represents a weekly schedule, which is a collection of daily schedules.
/// Each day in the week is represented by a `DayScheduleEntity` object.
/// This entity is used to manage and display the entire weekly schedule in the application.
/// The `schedule` field is a list of `DayScheduleEntity` objects,
/// where each object contains the date and a list of entries for that day.
@freezed
abstract class ScheduleEntity with _$ScheduleEntity {
  factory ScheduleEntity({
    required List<DayScheduleEntity> schedule,
  }) = _ScheduleEntity;

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntityFromJson(json);
}
