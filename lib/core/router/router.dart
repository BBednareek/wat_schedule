import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/screens/get_faculty_group_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/main',
  routes: [
    simpleRoute(
      path: '/main',
      builder: (context, state) => const GetFacultyGroupScreen(),
    ),
  ],
);

GoRoute simpleRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) builder,
}) =>
    GoRoute(
      path: path,
      pageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: builder(context, state)),
    );
