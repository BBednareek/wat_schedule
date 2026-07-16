import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/constants/app_routes.dart';
import 'package:wat_schedule/core/constants/departments.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_groups_header.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_groups_view.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/search_faculty_group/presentation/bloc/faculty_group_search_bloc.dart';

class FacultyGroupsScreen extends StatelessWidget {
  final Department department;

  const FacultyGroupsScreen({
    required this.department,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<FacultyGroupsBloc, FacultyGroupsState>(
      listenWhen: (previous, current) =>
          current is FacultyGroupsLoaded &&
          (previous is! FacultyGroupsLoaded ||
              previous.entity != current.entity),
      listener: (context, state) {
        if (state case FacultyGroupsLoaded(:final entity)) {
          context.read<FacultyGroupSearchBloc>().add(
                FacultyGroupSearchEvent.setGroups(
                  groups: entity.groupsByDepartment,
                ),
              );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              FacultyGroupsHeader(departmentName: department.name),
              Expanded(
                child: FacultyGroupsView(
                  onGroupSelected: (groupName) =>
                      _selectGroup(context, groupName),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectGroup(BuildContext context, String groupName) {
    context.read<FacultyGroupsBloc>().add(
          FacultyGroupsEvent.selectGroup(groupName: groupName),
        );
    context.read<WeeklyScheduleBloc>().add(
          WeeklyScheduleEvent.load(group: groupName),
        );
    context.go(AppRoutes.weeklySchedule);
  }
}
