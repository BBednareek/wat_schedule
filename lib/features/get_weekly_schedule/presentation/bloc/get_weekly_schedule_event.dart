part of 'get_weekly_schedule_bloc.dart';

/// This file defines the events for the GetWeeklyScheduleBloc.
/// It includes events for fetching the weekly schedule and handling another weekly schedule request.
@freezed
abstract class GetWeeklyScheduleEvent with _$GetWeeklyScheduleEvent {
  const factory GetWeeklyScheduleEvent.getSchedules({required String group}) =
      GetSchedules;
  const factory GetWeeklyScheduleEvent.anotherWeeklySchedule(
      {required bool isForward}) = AnotherWeeklySchedule;
}
