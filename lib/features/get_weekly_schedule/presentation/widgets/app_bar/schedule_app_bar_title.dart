import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/app_bar/schedule_week_navigation_button.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/settings/schedule_settings_sheet.dart';

class ScheduleAppBarTitle extends StatelessWidget {
  const ScheduleAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final WeeklyScheduleState scheduleState =
        context.watch<WeeklyScheduleBloc>().state;
    final String groupName = scheduleState.groupName;
    final ThemeData theme = Theme.of(context);
    final Color color = theme.colorScheme.onSurface;

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          ScheduleWeekNavigationButton(
            isForward: false,
            onPressed: scheduleState.isLoading
                ? null
                : () => context.read<WeeklyScheduleBloc>().add(
                      const WeeklyScheduleEvent.changeWeek(forward: false),
                    ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Tooltip(
              message: groupName,
              child: Text(
                groupName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: color,
            onPressed: () => showScheduleSettingsSheet(context: context),
            tooltip: 'Ustawienia',
          ),
          const SizedBox(width: 4),
          ScheduleWeekNavigationButton(
            isForward: true,
            onPressed: scheduleState.isLoading
                ? null
                : () => context.read<WeeklyScheduleBloc>().add(
                      const WeeklyScheduleEvent.changeWeek(forward: true),
                    ),
          ),
        ],
      ),
    );
  }
}
