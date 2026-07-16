import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';

class ScheduleWeekRange extends StatelessWidget {
  const ScheduleWeekRange({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeeklyScheduleBloc, WeeklyScheduleState>(
      buildWhen: (previous, current) =>
          previous.currentDate != current.currentDate,
      builder: (context, state) {
        final DateTime? currentDate = state.currentDate;

        if (currentDate == null) return const SizedBox.shrink();

        final String weekRange = _weekRangeFor(currentDate);

        return Semantics(
          label: 'Wyświetlany tydzień: $weekRange',
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.date_range_outlined,
                size: 15,
                color: context.scheduleColors.mutedText,
              ),
              const SizedBox(width: 6),
              Text(
                weekRange,
                style: context.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  String _weekRangeFor(DateTime currentDate) {
    final DateTime monday =
        currentDate.subtract(Duration(days: currentDate.weekday - 1));
    final DateTime sunday = monday.add(const Duration(days: 6));

    return '${_formatDate(monday)} - ${_formatDate(sunday)}';
  }

  String _formatDate(DateTime date) {
    final String day = date.day.toString().padLeft(2, '0');
    final String month = date.month.toString().padLeft(2, '0');

    return '$day.$month.${date.year}';
  }
}
