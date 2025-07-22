import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/addons/main_run.dart';
import 'package:wat_schedule/core/router/router.dart';
import 'package:wat_schedule/core/theme/theme.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

/// Main entry point of the application.
/// It initializes the application by running the main addon methods,
/// sets up the [BlocProvider] for the [ThemeCubit], and builds the [MaterialApp].
/// This is the starting point for the Flutter application.
Future<void> main() async {
  await MainMethods.mainAddon();

  runApp(const MainApp());
}

/// MainApp widget that serves as the root of the application.
/// It provides the [ThemeCubit] to the widget tree and builds the [MaterialApp].
/// The [MaterialApp] is configured with light and dark themes, theme mode,
/// and the router configuration.
/// It also sets the title and disables the debug banner.
/// This widget is stateless and does not maintain any state.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeEntity>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
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
