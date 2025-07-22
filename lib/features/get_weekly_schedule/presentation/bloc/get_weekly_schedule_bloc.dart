import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wat_schedule/core/extensions/schedule_extensions.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/get_weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/usecases/get_weekly_schedule_usecase.dart';

part 'get_weekly_schedule_bloc.freezed.dart';
part 'get_weekly_schedule_event.dart';
part 'get_weekly_schedule_state.dart';

/// Bloc for managing the weekly schedule state.
/// It handles events to fetch the weekly schedule and emits states accordingly.
/// This bloc uses the [GetWeeklyScheduleUsecase] to retrieve the schedule data.
class GetWeeklyScheduleBloc
    extends Bloc<GetWeeklyScheduleEvent, GetWeeklyScheduleState> {
  final GetWeeklyScheduleUsecase getWeeklyScheduleUsecase;
  GetWeeklyScheduleBloc({required this.getWeeklyScheduleUsecase})
      : super(const GetWeeklyScheduleState()) {
    on<GetSchedules>(_onGetSchedules);
    on<AnotherWeeklySchedule>(_onAnotherWeeklySchedule);
  }

  /// Handles the [GetSchedules] event to fetch the weekly schedule.
  /// It retrieves the current date, generates the necessary parameters,
  /// and calls the use case to get the schedule.
  /// If successful, it emits a [LoadedSchedule] state with the retrieved schedules.
  /// If an error occurs, it emits an [ErrorSchedule] state with the error message
  Future<void> _onGetSchedules(
      GetSchedules event, Emitter<GetWeeklyScheduleState> emit) async {
    emit(state.copyWith(isLoading: true, groupName: event.group));
    final DateTime now = DateTime.now();
    final Map<String, String> params = generateScheduleParams(now: now);

    emit(state.copyWith(currentDate: now));

    final Either<Failure, ScheduleEntity> result =
        await getWeeklyScheduleUsecase.call(
      group: event.group,
      month: params['month']!,
      week: params['week']!,
      start_date: params['start_date']!,
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, message: l.message)),
      (r) => emit(
        state.copyWith(message: null, schedules: r, isLoading: false),
      ),
    );
  }

  Future<void> _onAnotherWeeklySchedule(
      AnotherWeeklySchedule event, Emitter<GetWeeklyScheduleState> emit) async {
    emit(state.copyWith(isLoading: true));

    final DateTime baseDate = state.currentDate ?? DateTime.now();
    final DateTime targetDate = event.isForward
        ? baseDate.add(const Duration(days: 7))
        : baseDate.subtract(const Duration(days: 7));

    emit(state.copyWith(currentDate: targetDate));

    final Map<String, String> params = generateScheduleParams(now: targetDate);

    final Either<Failure, ScheduleEntity> result =
        await getWeeklyScheduleUsecase.call(
      group: state.groupName,
      month: params['month']!,
      week: params['week']!,
      start_date: params['start_date']!,
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, message: l.message)),
      (r) => emit(
        state.copyWith(message: null, schedules: r, isLoading: false),
      ),
    );
  }
}
