import 'package:flutter/material.dart';
import 'package:wat_schedule/features/get_faculty_groups/presentation/widgets/faculty_group_list/faculty_group_tile.dart';

class FacultyGroupList extends StatelessWidget {
  final List<String> groups;
  final String? selectedGroupName;
  final ValueChanged<String> onGroupSelected;

  const FacultyGroupList({
    required this.groups,
    required this.selectedGroupName,
    required this.onGroupSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: groups.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final groupName = groups[index];

        return FacultyGroupTile(
          groupName: groupName,
          isSelected: groupName == selectedGroupName,
          onSelected: onGroupSelected,
        );
      },
    );
  }
}
