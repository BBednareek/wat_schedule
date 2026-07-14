import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/constants/departements.dart';
import 'package:wat_schedule/core/di/injectable.dart';
import 'package:wat_schedule/features/choose_departement/presentation/screens/choose_departement.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/screens/get_faculty_group_screen.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/screen/get_weekly_schedule_screen.dart';

GoRouter createAppRouter({required GetWeeklyScheduleBloc weeklyScheduleBloc}) {
  return GoRouter(
    initialLocation: weeklyScheduleBloc.state.groupName.isNotEmpty
        ? '/display-schedule'
        : '/choose-department',
    routes: [
      simpleRoute(
          path: '/choose-department',
          builder: (context, state) => const ChooseDepartement()),
      simpleRoute(
          path: '/choose-faculty-group',
          builder: (context, state) {
            final Department? department = state.extra as Department?;

            if (department == null || department.code.isEmpty)
              return const ChooseDepartement();

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) =>
                      FacultyGroupsBloc(facultyGroupsUsecase: locator())
                        ..add(FacultyGroupsEvent.getFacultyGroups(
                            department: department.code)),
                ),
                BlocProvider.value(value: weeklyScheduleBloc)
              ],
              child: GetFacultyGroupScreen(
                department: department,
              ),
            );
          }),
      simpleRoute(
        path: '/display-schedule',
        builder: (context, state) => BlocProvider.value(
          value: weeklyScheduleBloc,
          child: const GetWeeklyScheduleScreen(),
        ),
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
