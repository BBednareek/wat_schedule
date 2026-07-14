import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
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

@lazySingleton
class GetWeeklyScheduleBloc
    extends HydratedBloc<GetWeeklyScheduleEvent, GetWeeklyScheduleState> {
  final GetWeeklyScheduleUsecase getWeeklyScheduleUsecase;
  GetWeeklyScheduleBloc({required this.getWeeklyScheduleUsecase})
      : super(const GetWeeklyScheduleState()) {
    on<GetSchedules>(_onGetSchedules);
    on<AnotherWeeklySchedule>(_onAnotherWeeklySchedule);
  }

  /// Checks whether the cached schedule needs to be refreshed based on the current date.
  void refreshCachedScheduleIfNeeded({DateTime? now}) {
    final String cachedGroupName = state.groupName;

    if (cachedGroupName.isEmpty) return;

    final DateTime currentDate = now ?? DateTime.now();
    final DateTime? cachedDate = state.currentDate;
    final bool hasCurrentWeekSchedule = cachedDate != null &&
        state.schedules != null &&
        isSameScheduleWeek(cachedDate, currentDate);

    if (hasCurrentWeekSchedule) return;

    add(GetWeeklyScheduleEvent.getSchedules(group: cachedGroupName));
  }

  /// Handles the [GetSchedules] event to fetch the weekly schedule.
  /// It retrieves the current date, generates the necessary parameters,
  /// and calls the use case to get the schedule.
  /// If successful, it emits a [LoadedSchedule] state with the retrieved schedules.
  /// If an error occurs, it emits an [ErrorSchedule] state with the error message
  Future<void> _onGetSchedules(
          GetSchedules event, Emitter<GetWeeklyScheduleState> emit) async =>
      await _fetchSchedule(
        emit: emit,
        group: event.group,
        targetDate: DateTime.now(),
      );

  Future<void> _onAnotherWeeklySchedule(
      AnotherWeeklySchedule event, Emitter<GetWeeklyScheduleState> emit) async {
    final String groupName = state.groupName;

    if (groupName.isEmpty) {
      emit(state.copyWith(
          message: 'Group name is empty. Cannot fetch schedule.'));
      return;
    }

    final DateTime baseDate = state.currentDate ?? DateTime.now();
    final DateTime targetDate = event.isForward
        ? baseDate.add(const Duration(days: 7))
        : baseDate.subtract(const Duration(days: 7));

    await _fetchSchedule(emit: emit, group: groupName, targetDate: targetDate);

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

  /// Extension to not write the same code twice, this method is used to emit a loading state before fetching the schedule.
  Future<void> _fetchSchedule({
    required Emitter<GetWeeklyScheduleState> emit,
    required String group,
    required DateTime targetDate,
  }) async =>
      emit(
        state.copyWith(
          isLoading: true,
          groupName: group,
          currentDate: targetDate,
          schedules: null,
          message: null,
        ),
      );

  @override
  GetWeeklyScheduleState? fromJson(Map<String, dynamic> json) {
    try {
      final String? currentDate = json['currentDate'] as String?;

      return GetWeeklyScheduleState(
        groupName: json['groupName'] as String? ?? '',
        currentDate:
            currentDate == null ? null : DateTime.tryParse(currentDate),
        schedules: json['schedules'] == null
            ? null
            : ScheduleEntity.fromJson(
                json['schedules'] as Map<String, dynamic>),
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(GetWeeklyScheduleState state) {
    if (state.groupName.isEmpty &&
        state.currentDate == null &&
        state.schedules == null) return null;

    return {
      'groupName': state.groupName,
      'currentDate': state.currentDate?.toIso8601String(),
      'schedules': state.schedules?.toJson(),
    };
  }
}
