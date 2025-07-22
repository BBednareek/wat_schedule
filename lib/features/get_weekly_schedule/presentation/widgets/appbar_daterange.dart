import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';

class AppBarDateRange extends StatelessWidget {
  const AppBarDateRange({super.key});

  String formatDate(DateTime date) =>
      "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}";

  String getFullWeekRange(DateTime currentDate) {
    final monday =
        currentDate.subtract(Duration(days: currentDate.weekday - 1));

    final sunday = monday.add(const Duration(days: 6));

    return '${formatDate(monday)} - ${formatDate(sunday)}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeeklyScheduleBloc, GetWeeklyScheduleState>(
      builder: (context, state) {
        if (state.currentDate == null) return const SizedBox.shrink();

        return Text(
          getFullWeekRange(state.currentDate!),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
