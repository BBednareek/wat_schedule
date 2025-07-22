import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/bottom_sheet.dart';

class AppBarTitleRow extends StatelessWidget {
  const AppBarTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final groupName = context.watch<GetWeeklyScheduleBloc>().state.groupName;
    final color = Theme.of(context).colorScheme.onPrimary;

    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Centered group name
          Center(
            child: Text(
              groupName,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          // Left arrow
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: color,
              onPressed: () => context.read<GetWeeklyScheduleBloc>()
                ..add(
                  const GetWeeklyScheduleEvent.anotherWeeklySchedule(
                    isForward: false,
                  ),
                ),
            ),
          ),
          // Settings icon right next to group name (right side, but not at the edge)
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: color,
                  onPressed: () => showFiltersBottomSheet(context: context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: color,
                  onPressed: () => context.read<GetWeeklyScheduleBloc>()
                    ..add(
                      const GetWeeklyScheduleEvent.anotherWeeklySchedule(
                        isForward: true,
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
