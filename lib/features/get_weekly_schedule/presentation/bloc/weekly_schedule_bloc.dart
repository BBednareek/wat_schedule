import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/extensions/schedule_extensions.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/use_cases/get_weekly_schedule_use_case.dart';

part 'weekly_schedule_bloc.freezed.dart';
part 'weekly_schedule_event.dart';
part 'weekly_schedule_state.dart';

/// Bloc for managing the weekly schedule state.
/// It handles events to fetch the weekly schedule and emits states accordingly.
/// This bloc uses the [GetWeeklyScheduleUseCase] to retrieve the schedule data.

@lazySingleton
class WeeklyScheduleBloc
    extends HydratedBloc<WeeklyScheduleEvent, WeeklyScheduleState> {
  final GetWeeklyScheduleUseCase getWeeklyScheduleUseCase;
  int _requestGeneration = 0;

  WeeklyScheduleBloc({required this.getWeeklyScheduleUseCase})
      : super(const WeeklyScheduleState()) {
    on<LoadWeeklySchedule>(_onLoadSchedule);
    on<ChangeScheduleWeek>(
      _onChangeWeek,
      transformer: _sequential<ChangeScheduleWeek>(),
    );
    on<ResetWeeklySchedule>(_onReset);
  }

  /// Checks whether the cached schedule needs to be refreshed based on the current date.
  void refreshCachedScheduleIfNeeded({DateTime? now}) {
    final String cachedGroupName = state.groupName;

    if (cachedGroupName.isEmpty) return;

    final DateTime currentDate = now ?? DateTime.now();
    final DateTime? cachedDate = state.currentDate;
    final bool hasCurrentWeekSchedule = cachedDate != null &&
        state.schedule != null &&
        isSameScheduleWeek(cachedDate, currentDate);

    if (hasCurrentWeekSchedule) return;

    add(WeeklyScheduleEvent.load(group: cachedGroupName));
  }

  /// Handles the [LoadWeeklySchedule] event to fetch the weekly schedule.
  /// It retrieves the current date, generates the necessary parameters,
  /// and calls the use case to get the schedule.
  /// If successful, it emits a [LoadedSchedule] state with the retrieved schedule.
  /// If an error occurs, the state contains an error message.
  Future<void> _onLoadSchedule(
          LoadWeeklySchedule event, Emitter<WeeklyScheduleState> emit) async =>
      await _fetchSchedule(
        emit: emit,
        group: event.group,
        targetDate: DateTime.now(),
      );

  Future<void> _onChangeWeek(
      ChangeScheduleWeek event, Emitter<WeeklyScheduleState> emit) async {
    final String groupName = state.groupName;

    if (groupName.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'Najpierw wybierz grupę, aby wyświetlić plan.',
        ),
      );
      return;
    }

    final DateTime baseDate = state.currentDate ?? DateTime.now();
    final DateTime targetDate = event.forward
        ? baseDate.add(const Duration(days: 7))
        : baseDate.subtract(const Duration(days: 7));

    await _fetchSchedule(emit: emit, group: groupName, targetDate: targetDate);
  }

  void _onReset(
    ResetWeeklySchedule event,
    Emitter<WeeklyScheduleState> emit,
  ) {
    _requestGeneration++;
    emit(const WeeklyScheduleState());
  }

  Future<void> _fetchSchedule({
    required Emitter<WeeklyScheduleState> emit,
    required String group,
    required DateTime targetDate,
  }) async {
    final int requestGeneration = ++_requestGeneration;
    final DateTime targetWeek = startOfScheduleWeek(targetDate);

    emit(
      state.copyWith(
        isLoading: true,
        groupName: group,
        currentDate: targetWeek,
        schedule: null,
        errorMessage: null,
      ),
    );

    final ScheduleRequestParameters parameters =
        ScheduleRequestParameters.forDate(targetWeek);
    final result = await getWeeklyScheduleUseCase.call(
      group: group,
      month: parameters.month,
      week: parameters.week,
      startDate: parameters.startDate,
    );

    if (requestGeneration != _requestGeneration) return;

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          schedule: null,
          errorMessage: failure.errorMessage,
        ),
      ),
      (schedule) => emit(
        state.copyWith(
          isLoading: false,
          schedule: schedule,
          currentDate: targetWeek,
          errorMessage: null,
        ),
      ),
    );
  }

  @override
  WeeklyScheduleState? fromJson(Map<String, dynamic> json) {
    try {
      final String? currentDate = json['currentDate'] as String?;
      final Object? scheduleJson = json['schedule'] ?? json['schedules'];

      return WeeklyScheduleState(
        groupName: json['groupName'] as String? ?? '',
        currentDate:
            currentDate == null ? null : DateTime.tryParse(currentDate),
        schedule: scheduleJson == null
            ? null
            : WeeklyScheduleEntity.fromJson(
                scheduleJson as Map<String, dynamic>,
              ),
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeeklyScheduleState state) {
    if (state.groupName.isEmpty &&
        state.currentDate == null &&
        state.schedule == null) return null;

    return {
      'groupName': state.groupName,
      'currentDate': state.currentDate?.toIso8601String(),
      'schedule': state.schedule?.toJson(),
    };
  }
}

EventTransformer<Event> _sequential<Event>() {
  return (events, mapper) => events.asyncExpand(mapper);
}
