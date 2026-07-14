import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/addons/main_run.dart';
import 'package:wat_schedule/core/di/injectable.dart';
import 'package:wat_schedule/core/router/router.dart';
import 'package:wat_schedule/core/theme/theme.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

Future<void> main() async {
  await MainMethods.mainAddon();

  final GetWeeklyScheduleBloc weeklyScheduleBloc =
      GetWeeklyScheduleBloc(getWeeklyScheduleUsecase: locator());

  weeklyScheduleBloc.refreshCachedScheduleIfNeeded();

  final GoRouter router = createAppRouter(
    weeklyScheduleBloc: weeklyScheduleBloc,
  );

  runApp(
    MainApp(
      weeklyScheduleBloc: locator<GetWeeklyScheduleBloc>(),
      router: router,
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
    required this.weeklyScheduleBloc,
    required this.router,
  });

  final GetWeeklyScheduleBloc weeklyScheduleBloc;
  final GoRouter router;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void dispose() {
    widget.weeklyScheduleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeEntity>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: state.theme,
            debugShowCheckedModeBanner: false,
            title: 'Wat schedule',
            routerConfig: widget.router,
          );
        },
      ),
    );
  }
}
