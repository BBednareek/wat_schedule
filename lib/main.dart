import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/addons/main_run.dart';
import 'package:wat_schedule/core/di/injectable.dart';
import 'package:wat_schedule/core/router/router.dart';
import 'package:wat_schedule/core/theme/theme.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

Future<void> main() async {
  await MainMethods.mainAddon();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeEntity>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.theme,
            debugShowCheckedModeBanner: false,
            title: 'Wat schedule',
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
