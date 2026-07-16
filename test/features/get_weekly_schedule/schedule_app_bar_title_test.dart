import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/data/repository/get_weekly_schedule_repository.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/use_cases/get_weekly_schedule_use_case.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/app_bar/schedule_app_bar_title.dart';

void main() {
  testWidgets('long group name does not push app bar actions off screen', (
    tester,
  ) async {
    const String longGroupName =
        'WME25BL2S6_-_Podstawowy_kurs_bardzo_długa_nazwa_grupy';
    HydratedBloc.storage = _MemoryStorage();
    final WeeklyScheduleBloc scheduleBloc = WeeklyScheduleBloc(
      getWeeklyScheduleUseCase: GetWeeklyScheduleUseCase(
        getWeeklyScheduleRepository: _NoopScheduleRepository(),
      ),
    );
    addTearDown(scheduleBloc.close);
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.binding.setSurfaceSize(const Size(320, 640));

    scheduleBloc.add(const WeeklyScheduleEvent.load(group: longGroupName));
    await scheduleBloc.stream.firstWhere(
      (state) => state.groupName == longGroupName && !state.isLoading,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: scheduleBloc,
          child: const Scaffold(body: ScheduleAppBarTitle()),
        ),
      ),
    );

    final Text groupNameText = tester.widget(find.text(longGroupName));
    expect(groupNameText.maxLines, 1);
    expect(groupNameText.overflow, TextOverflow.ellipsis);
    expect(find.byTooltip('Ustawienia'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

class _NoopScheduleRepository implements GetWeeklyScheduleRepository {
  @override
  Future<Either<Failure, WeeklyScheduleEntity>> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    required String startDate,
  }) async {
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
