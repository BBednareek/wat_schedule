part of 'weekly_schedule_bloc.dart';

/// This file defines the events for the WeeklyScheduleBloc.
/// It includes events for fetching the weekly schedule and handling another weekly schedule request.
@freezed
abstract class WeeklyScheduleEvent with _$WeeklyScheduleEvent {
  const factory WeeklyScheduleEvent.load({required String group}) =
      LoadWeeklySchedule;
  const factory WeeklyScheduleEvent.changeWeek({required bool forward}) =
      ChangeScheduleWeek;
  const factory WeeklyScheduleEvent.reset() = ResetWeeklySchedule;
}
