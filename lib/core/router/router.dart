import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/constants/app_routes.dart';
import 'package:wat_schedule/core/constants/departments.dart';
import 'package:wat_schedule/core/di/injectable.dart';
import 'package:wat_schedule/features/choose_department/presentation/screens/choose_department_screen.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/screens/faculty_groups_screen.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/screens/weekly_schedule_screen.dart';
import 'package:wat_schedule/features/search_faculty_group/presentation/bloc/faculty_group_search_bloc.dart';

GoRouter createAppRouter({required WeeklyScheduleBloc weeklyScheduleBloc}) {
  return GoRouter(
    initialLocation: weeklyScheduleBloc.state.groupName.isNotEmpty
        ? AppRoutes.weeklySchedule
        : AppRoutes.chooseDepartment,
    routes: [
      _materialRoute(
          path: AppRoutes.chooseDepartment,
          builder: (context, state) => const ChooseDepartmentScreen()),
      _materialRoute(
          path: AppRoutes.chooseFacultyGroup,
          builder: (context, state) {
            final Department? department = state.extra as Department?;

            if (department == null || department.code.isEmpty)
              return const ChooseDepartmentScreen();

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => locator<FacultyGroupsBloc>()
                    ..add(
                      FacultyGroupsEvent.load(department: department.code),
                    ),
                ),
                BlocProvider(create: (_) => FacultyGroupSearchBloc()),
                BlocProvider.value(value: weeklyScheduleBloc),
              ],
              child: FacultyGroupsScreen(
                department: department,
              ),
            );
          }),
      _materialRoute(
        path: AppRoutes.weeklySchedule,
        builder: (context, state) => BlocProvider.value(
          value: weeklyScheduleBloc,
          child: const WeeklyScheduleScreen(),
        ),
      ),
    ],
  );
}

GoRoute _materialRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) builder,
}) =>
    GoRoute(
      path: path,
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: builder(context, state)),
    );
