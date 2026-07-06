import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/addons/main_run.dart';
import 'package:wat_schedule/core/di/injectable.dart';
import 'package:wat_schedule/core/router/router.dart';
import 'package:wat_schedule/core/theme/theme.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

Future<void> main() async {
  await MainMethods.mainAddon();

  final facultyGroupsBloc = FacultyGroupsBloc(
    facultyGroupsUsecase: locator(),
  );

  final weeklyScheduleBloc = GetWeeklyScheduleBloc(
    getWeeklyScheduleUsecase: locator(),
  );

  final facultyState = facultyGroupsBloc.state;

  if (facultyState is LoadedGroups) {
    final selectedGroupName = facultyState.selectedGroupNam;

    if (selectedGroupName != null && selectedGroupName.isNotEmpty) {
      weeklyScheduleBloc.add(
        GetWeeklyScheduleEvent.getSchedules(
          group: selectedGroupName,
        ),
      );
    }
  } else {
    facultyGroupsBloc.add(
      const FacultyGroupsEvent.getFacultyGroups(),
    );
  }

  final router = createAppRouter(
    facultyGroupsBloc: facultyGroupsBloc,
    weeklyScheduleBloc: weeklyScheduleBloc,
  );

  runApp(
    MainApp(
      facultyGroupsBloc: facultyGroupsBloc,
      weeklyScheduleBloc: weeklyScheduleBloc,
      router: router,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.facultyGroupsBloc,
    required this.weeklyScheduleBloc,
    required this.router,
  });

  final FacultyGroupsBloc facultyGroupsBloc;
  final GetWeeklyScheduleBloc weeklyScheduleBloc;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: facultyGroupsBloc,
        ),
        BlocProvider.value(
          value: weeklyScheduleBloc,
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeEntity>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            themeMode: state.theme,
            debugShowCheckedModeBanner: false,
            title: 'Wat schedule',
            routerConfig: router,
          );
        },
      ),
    );
  }
}
