import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';

class GetFacultyGroupScreen extends StatelessWidget {
  const GetFacultyGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (entity, selectedGroupName) {
                      final List<MapEntry<String, List<String>>> entries =
                          entity.groups_by_faculty.entries.toList();

                      return ListView.builder(
                        itemCount: entries.length,
                        itemBuilder: (context, index) {
                          final String faculty = entries[index].key;
                          final List<String> groups = entries[index].value;

                          return ExpansionTile(
                            title: Text(
                              faculty,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            children: groups.map((groupName) {
                              final bool isSelected =
                                  groupName == selectedGroupName;

                              return ListTile(
                                selected: isSelected,
                                hoverColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                textColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                selectedColor:
                                    Theme.of(context).colorScheme.primary,
                                title: Text(groupName),
                                onTap: () {
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

                                  context.go('/schedule');
                                },
                              );
                            }).toList(),
                          );
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
