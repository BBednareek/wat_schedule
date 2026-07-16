import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wat_schedule/core/extensions/schedule_extensions.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/data/repository/get_weekly_schedule_repository.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/use_cases/get_weekly_schedule_use_case.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';

void main() {
  setUp(() {
    HydratedBloc.storage = _MemoryStorage();
  });

  test('queues rapid week changes across month boundaries', () async {
    final _RecordingScheduleRepository repository =
        _RecordingScheduleRepository();
    final WeeklyScheduleBloc bloc = WeeklyScheduleBloc(
      getWeeklyScheduleUseCase: GetWeeklyScheduleUseCase(
        getWeeklyScheduleRepository: repository,
      ),
    );
    addTearDown(bloc.close);

    bloc.add(const WeeklyScheduleEvent.load(group: 'WCY 1'));
    await bloc.stream.firstWhere(
      (state) => !state.isLoading && state.currentDate != null,
    );
    final DateTime initialDate = bloc.state.currentDate!;

    bloc
      ..add(const WeeklyScheduleEvent.changeWeek(forward: false))
      ..add(const WeeklyScheduleEvent.changeWeek(forward: false))
      ..add(const WeeklyScheduleEvent.changeWeek(forward: false))
      ..add(const WeeklyScheduleEvent.changeWeek(forward: false));

    final DateTime expectedDate = initialDate.subtract(
      const Duration(days: 28),
    );
    await bloc.stream.firstWhere(
      (state) => !state.isLoading && state.currentDate == expectedDate,
    );

    expect(bloc.state.currentDate, expectedDate);
    final List<ScheduleRequestParameters> expectedRequests = List.generate(
      5,
      (index) => ScheduleRequestParameters.forDate(
        initialDate.subtract(Duration(days: index * 7)),
      ),
    );
    expect(
      repository.startDates,
      expectedRequests.map((request) => request.startDate),
    );
    expect(
      repository.months,
      expectedRequests.map((request) => request.month),
    );
  });

  test('reset clears state and ignores an in-flight response', () async {
    final WeeklyScheduleBloc bloc = WeeklyScheduleBloc(
      getWeeklyScheduleUseCase: GetWeeklyScheduleUseCase(
        getWeeklyScheduleRepository: _RecordingScheduleRepository(),
      ),
    );
    addTearDown(bloc.close);

    bloc.add(const WeeklyScheduleEvent.load(group: 'OLD GROUP'));
    await bloc.stream.firstWhere((state) => state.isLoading);

    final Future<WeeklyScheduleState> resetState = bloc.stream.firstWhere(
      (state) =>
          !state.isLoading &&
          state.groupName.isEmpty &&
          state.currentDate == null &&
          state.schedule == null,
    );
    bloc.add(const WeeklyScheduleEvent.reset());
    await resetState;
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(bloc.state, const WeeklyScheduleState());
  });
}

class _RecordingScheduleRepository implements GetWeeklyScheduleRepository {
  final List<String> startDates = [];
  final List<String> months = [];

  @override
  Future<Either<Failure, WeeklyScheduleEntity>> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    required String startDate,
  }) async {
    startDates.add(startDate);
    months.add(month);
    await Future<void>.delayed(const Duration(milliseconds: 5));
    return Right(WeeklyScheduleEntity(days: const []));
  }
}

class _MemoryStorage implements Storage {
  final Map<String, dynamic> _values = {};

  @override
  dynamic read(String key) => _values[key];

  @override
  Future<void> write(String key, dynamic value) async {
    _values[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    _values.remove(key);
  }

  @override
  Future<void> clear() async {
    _values.clear();
  }

  @override
  Future<void> close() async {}
}
