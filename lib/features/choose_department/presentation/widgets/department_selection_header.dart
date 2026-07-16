import 'package:flutter/material.dart';
import 'package:wat_schedule/features/choose_department/presentation/widgets/theme_mode_switch_tile.dart';

class DepartmentSelectionHeader extends StatelessWidget {
  const DepartmentSelectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wybierz wydział',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            'Najpierw wybierz wydział, potem wybierzesz grupę, '
            'której plan chcesz wyświetlić.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          const ThemeModeSwitchTile(),
        ],
      ),
    );
  }
}
