import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/schedule_entry_entity.dart';

part 'day_schedule_entity.freezed.dart';
part 'day_schedule_entity.g.dart';

/// Represents a schedule for a single day, containing a date and a list of entries.
/// Each entry represents a specific event or activity scheduled for that day.
/// This entity is used to manage and display daily schedule in the application.
/// It is part of the domain layer, encapsulating the business logic related to daily schedule.
/// The `date` field is a string representing the date of the schedule,
/// and the `entries` field is a list of `ScheduleEntryEntity` objects that detail the scheduled events.
/// The `DayScheduleEntity` can be serialized to and from JSON format for easy data transfer
/// and storage, making it suitable for use in APIs or local databases.
@freezed
abstract class DayScheduleEntity with _$DayScheduleEntity {
  factory DayScheduleEntity({
    required String date,
    required List<ScheduleEntryEntity> entries,
  }) = _DayScheduleEntity;

  factory DayScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$DayScheduleEntityFromJson(json);
}
