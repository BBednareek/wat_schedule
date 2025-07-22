part of 'get_weekly_schedule_bloc.dart';

/// This file is part of the GetWeeklySchedule feature in the application.
/// It defines the states for the GetWeeklyScheduleBloc.
/// The states include loading, loaded with a schedule, and error with a message.
@freezed
abstract class GetWeeklyScheduleState with _$GetWeeklyScheduleState {
  const factory GetWeeklyScheduleState({
    @Default(false) bool isLoading,
    @Default(null) ScheduleEntity? schedules,
    @Default('') String groupName,
    @Default(null) String? message,
    @Default(null) DateTime? currentDate,
  }) = _GetWeeklyScheduleState;
}
