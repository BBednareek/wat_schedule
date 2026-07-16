import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/bloc/faculty_groups_bloc.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_group_list/faculty_group_list_skeleton.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_group_search_results.dart';
import 'package:wat_schedule/features/search_faculty_group/presentation/widgets/faculty_group_search_field.dart';

class FacultyGroupsView extends StatelessWidget {
  final ValueChanged<String> onGroupSelected;

  const FacultyGroupsView({
    required this.onGroupSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacultyGroupsBloc, FacultyGroupsState>(
      listenWhen: (previous, current) => current is FacultyGroupsError,
      listener: (context, state) {
        if (state case FacultyGroupsError(:final errorMessage)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is FacultyGroupsLoading || current is FacultyGroupsLoaded,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const FacultyGroupListSkeleton(),
          loaded: (entity, selectedGroupName) {
            if (entity.groupsByDepartment.isEmpty) {
              return Center(
                child: Text(
                  'Brak grup dla wybranego wydziału',
                  style: context.textTheme.bodyMedium,
                ),
              );
            }

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: FacultyGroupSearchField(),
                ),
                Expanded(
                  child: FacultyGroupSearchResults(
                    selectedGroupName: selectedGroupName,
                    onGroupSelected: onGroupSelected,
                  ),
                ),
              ],
            );
          },
          orElse: SizedBox.shrink,
        );
      },
    );
  }
}
