import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/entry_schedule_entity.dart';

part 'daily_schedule_entity.freezed.dart';
part 'daily_schedule_entity.g.dart';

/// Represents a schedule for a single day, containing a date and a list of entries.
/// Each entry represents a specific event or activity scheduled for that day.
/// This entity is used to manage and display daily schedules in the application.
/// It is part of the domain layer, encapsulating the business logic related to daily schedules.
/// The `date` field is a string representing the date of the schedule,
/// and the `entries` field is a list of `EntryEntity` objects that detail the scheduled events.
/// The `DayScheduleEntity` can be serialized to and from JSON format for easy data transfer
/// and storage, making it suitable for use in APIs or local databases.
@freezed
abstract class DayScheduleEntity with _$DayScheduleEntity {
  factory DayScheduleEntity({
    required String date,
    required List<EntryEntity> entries,
  }) = _DayScheduleEntity;

  factory DayScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$DayScheduleEntityFromJson(json);
}
