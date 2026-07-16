import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_group_list/faculty_group_list.dart';
import 'package:wat_schedule/features/search_faculty_group/presentation/bloc/faculty_group_search_bloc.dart';

class FacultyGroupSearchResults extends StatelessWidget {
  final String? selectedGroupName;
  final ValueChanged<String> onGroupSelected;

  const FacultyGroupSearchResults({
    required this.selectedGroupName,
    required this.onGroupSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacultyGroupSearchBloc, FacultyGroupSearchState>(
      builder: (context, state) {
        if (state.filteredGroups.isEmpty) {
          return Center(
            child: Text(
              'Nie znaleziono grup',
              style: context.textTheme.bodyMedium,
            ),
          );
        }

        return FacultyGroupList(
          selectedGroupName: selectedGroupName,
          groups: state.filteredGroups,
          onGroupSelected: onGroupSelected,
        );
      },
    );
  }
}
