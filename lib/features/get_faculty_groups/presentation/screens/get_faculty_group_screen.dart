import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/constants/departements.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_group_list/faculty_group_list.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_group_list/faculty_group_list_skeleton.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';

class GetFacultyGroupScreen extends StatelessWidget {
  final Department department;
  const GetFacultyGroupScreen({required this.department, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  department.name,
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<FacultyGroupsBloc, FacultyGroupsState>(
                listenWhen: (previous, current) => current is ErrorGroups,
                listener: (context, state) {
                  if (state is ErrorGroups) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    current is LoadingGroups || current is LoadedGroups,
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const FacultyGroupListSkeleton(),
                    loaded: (entity, selectedGroupName) {
                      final List<String> groups = entity.groups_by_department;

                      return groups.isEmpty
                          ? Center(
                              child: Text(
                                'Brak grup dla wybranego wydziału',
                                style: theme.textTheme.bodyMedium,
                              ),
                            )
                          : FacultyGroupList(
                              selectedGroupName: selectedGroupName,
                              groups: groups,
                              onGroupSelected: (groupName) {
                                context.read<FacultyGroupsBloc>().add(
                                      FacultyGroupsEvent.selectGroup(
                                        groupName: groupName,
                                      ),
                                    );

                                context.read<GetWeeklyScheduleBloc>().add(
                                      GetWeeklyScheduleEvent.getSchedules(
                                        group: groupName,
                                      ),
                                    );

                                context.go('/display-schedule');
                              },
                            );
                    },
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
