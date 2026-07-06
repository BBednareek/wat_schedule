import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/screens/get_faculty_group_screen.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/screen/get_weekly_schedule_screen.dart';

GoRouter createAppRouter({
  required FacultyGroupsBloc facultyGroupsBloc,
  required GetWeeklyScheduleBloc weeklyScheduleBloc,
}) {
  return GoRouter(
    initialLocation: facultyGroupsBloc.state.maybeWhen(
      loaded: (entity, selectedGroupName) {
        if (selectedGroupName != null && selectedGroupName.isNotEmpty) {
          return '/schedule';
        }

        return '/main';
      },
      orElse: () => '/main',
    ),
    routes: [
      simpleRoute(
        path: '/main',
        builder: (context, state) => const GetFacultyGroupScreen(),
      ),
      simpleRoute(
        path: '/schedule',
        builder: (context, state) => const GetWeeklyScheduleScreen(),
      ),
    ],
  );
}

GoRoute simpleRoute({
  // The path for the route
  required String path,
  // The builder function that returns the widget for the route
  required Widget Function(BuildContext, GoRouterState) builder,
}) =>
// This function creates a simple route with the given path and builder
    GoRoute(
      path: path,
      pageBuilder: (context, state) =>
          // Using pageBuilder to create a MaterialPage
          // This allows for better navigation transitions and state management
          MaterialPage(key: state.pageKey, child: builder(context, state)),
    );
