import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';

/// A screen that displays a list of faculty groups.
/// It uses the [FacultyGroupsBloc] to manage the state of the groups.
/// The screen shows a loading indicator while the groups are being fetched,
/// and displays an error message if there is an issue fetching the groups.
/// Once the groups are loaded, it displays them in an expandable list format.
///Each faculty is represented as an expandable tile, and tapping on a group
/// will currently not perform any action.
/// This screen is part of the [get_faculty_groups] feature.
/// It is designed to be used within a Flutter application that uses the BLoC pattern for state management.
/// The screen is wrapped in a [SafeArea] to avoid system UI overlaps.
/// The [BlocConsumer] widget is used to listen for state changes and build the UI accordingly.
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
                    loaded: (entity) {
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
                            children: groups
                                .map(
                                  (groupName) => ListTile(
                                    hoverColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    textColor:
                                        Theme.of(context).colorScheme.onPrimary,
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
                                      context.go('/schedule', extra: groupName);
                                    },
                                  ),
                                )
                                .toList(),
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
