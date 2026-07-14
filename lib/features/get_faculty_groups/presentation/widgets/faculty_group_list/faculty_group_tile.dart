import 'package:flutter/material.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';

class FacultyGroupTile extends StatelessWidget {
  final String groupName;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const FacultyGroupTile({
    required this.groupName,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final scheduleColors = context.scheduleColors;

    return ListTile(
      selected: isSelected,
      tileColor: colorScheme.surface,
      selectedTileColor: colorScheme.primary.withAlpha(24),
      textColor: colorScheme.onSurface,
      selectedColor: colorScheme.primary,
      iconColor: scheduleColors.mutedText,
      title: Text(groupName),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => onSelected(groupName),
    );
  }
}
