import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';

class ScheduleWeekRange extends StatelessWidget {
  const ScheduleWeekRange({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeeklyScheduleBloc, GetWeeklyScheduleState>(
      buildWhen: (previous, current) =>
          previous.currentDate != current.currentDate,
      builder: (context, state) {
        final DateTime? currentDate = state.currentDate;

        if (currentDate == null) return const SizedBox.shrink();

        return Text(
          _weekRangeFor(currentDate),
          style: context.textTheme.bodySmall,
          textAlign: TextAlign.center,
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
