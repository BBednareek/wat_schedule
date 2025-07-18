import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/di/injectable.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';

class GetFacultyGroupScreen extends StatelessWidget {
  const GetFacultyGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FacultyGroupsBloc(facultyGroupsUsecase: locator())
        ..add(const FacultyGroupsEvent.getFacultyGroups()),
      child: const _GetFacultyGroupScreen(),
    );
  }
}

class _GetFacultyGroupScreen extends StatelessWidget {
  const _GetFacultyGroupScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Szukaj'))
        ],
      ),
    );
  }
}
