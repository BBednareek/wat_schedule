import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wat_schedule/core/theme/theme.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/data/repository/get_weekly_schedule_repository.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/use_cases/get_weekly_schedule_use_case.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/settings/schedule_settings_sheet.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

void main() {
  testWidgets('bottom sheet updates immediately when theme changes', (
    tester,
  ) async {
    HydratedBloc.storage = _MemoryStorage();
    final ThemeCubit themeCubit = ThemeCubit()..setLightTheme();
    final WeeklyScheduleBloc scheduleBloc = WeeklyScheduleBloc(
      getWeeklyScheduleUseCase: GetWeeklyScheduleUseCase(
        getWeeklyScheduleRepository: _NoopScheduleRepository(),
      ),
    );
    addTearDown(themeCubit.close);
    addTearDown(scheduleBloc.close);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: themeCubit),
          BlocProvider.value(value: scheduleBloc),
        ],
        child: BlocBuilder<ThemeCubit, ThemeEntity>(
          builder: (context, state) {
            return MaterialApp(
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: state.themeMode,
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () =>
                          showScheduleSettingsSheet(context: context),
                      child: const Text('Otwórz ustawienia'),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Otwórz ustawienia'));
    await tester.pumpAndSettle();
    expect(
      Theme.of(tester.element(find.text('Ustawienia'))).brightness,
      Brightness.light,
    );

    await tester.tap(
      find.widgetWithText(SwitchListTile, 'Ciemny motyw'),
    );
    await tester.pumpAndSettle();

    expect(
      Theme.of(tester.element(find.text('Ustawienia'))).brightness,
      Brightness.dark,
    );
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
