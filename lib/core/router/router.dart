import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/di/injectable.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/screens/get_faculty_group_screen.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/screen/get_weekly_schedule_screen.dart';

// This file defines the app's routing using GoRouter.
// It sets up routes for the main screen and the weekly schedule screen,
// and provides the necessary blocs for state management.
final GoRouter appRouter = GoRouter(
  // observers: [ChuckerFlutter.navigatorObserver],
  // The initial location of the app when it starts
  // This is set to the main screen where the faculty groups are displayed
  // The main screen is wrapped in a BlocProvider to provide the FacultyGroupsBloc
  // which is responsible for fetching and managing the faculty groups state
  initialLocation: '/main',
  // The routes for the app
  // Each route is defined using the simpleRoute function
  // which creates a GoRoute with the specified path and builder
  // The builder function returns the widget for the route
  // and can also provide the necessary blocs for that screen
  // The routes are defined as a list of GoRoute objects
  routes: [
    // The main route for the app
    simpleRoute(
      // The path for the main screen
      path: '/main',
      // The builder function that returns the GetFacultyGroupScreen
      // This screen displays the list of faculty groups
      // and allows the user to select a group to view its schedule
      // The BlocProvider is used to provide the FacultyGroupsBloc
      // which is responsible for fetching the faculty groups
      builder: (context, state) => MultiBlocProvider(
        providers: [
          // Creating the FacultyGroupsBloc with the usecase from the locator
          // The locator is a dependency injection container that provides the necessary dependencies
          // The FacultyGroupsBloc is responsible for managing the state of the faculty groups
          BlocProvider(
              create: (_) => FacultyGroupsBloc(facultyGroupsUsecase: locator())
                // Adding the event to fetch the faculty groups when the screen is built
                // This event triggers the bloc to fetch the faculty groups from the repository
                // The bloc will then emit the state which will be consumed by the UI
                ..add(const FacultyGroupsEvent.getFacultyGroups())),

          /// Providing the GetWeeklyScheduleBloc
          // This bloc is used to fetch the weekly schedule for a selected group
          BlocProvider(
              create: (_) => GetWeeklyScheduleBloc(
                    getWeeklyScheduleUsecase: locator(),
                  )),
        ],
        // Returning the GetFacultyGroupScreen widget
        // This screen will display the list of faculty groups
        // and allow the user to select a group to view its schedule
        child: const GetFacultyGroupScreen(),
      ),
    ),
    simpleRoute(
      // The path for the weekly schedule screen
      // This screen displays the weekly schedule for a selected group
      path: '/schedule',
      // The builder function that returns the GetWeeklyScheduleScreen
      // This screen displays the weekly schedule for the selected group
      // The BlocProvider is used to provide the GetWeeklyScheduleBloc
      // which is responsible for fetching the weekly schedule
      // The GetWeeklyScheduleBloc is created with the usecase from the locator
      // and the group is passed as an event to fetch the schedules for that group
      builder: (context, state) => MultiBlocProvider(
          // Providing GetWeeklyScheduleBloc with the selected group from the state
          providers: [
            BlocProvider(
              create: (context) =>
                  FacultyGroupsBloc(facultyGroupsUsecase: locator()),
            ),
            BlocProvider(
                create: (_) => GetWeeklyScheduleBloc(
                      getWeeklyScheduleUsecase: locator(),
                    )..add(GetSchedules(group: state.extra as String? ?? ''))),
          ],
          child: const GetWeeklyScheduleScreen()),
    )
  ],
);

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
