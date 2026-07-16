part of 'weekly_schedule_bloc.dart';

/// This file is part of the GetWeeklySchedule feature in the application.
/// It defines the states for the WeeklyScheduleBloc.
/// The state contains loading, schedule, selection, date, and error data.
@freezed
abstract class WeeklyScheduleState with _$WeeklyScheduleState {
  const factory WeeklyScheduleState({
    @Default(false) bool isLoading,
    @Default(null) WeeklyScheduleEntity? schedule,
    @Default('') String groupName,
    @Default(null) String? errorMessage,
    @Default(null) DateTime? currentDate,
  }) = _WeeklyScheduleState;
}
