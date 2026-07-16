import 'package:flutter/material.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/day_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/empty_day_schedule_tile.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/schedule_entry_tile.dart';

class ScheduleDayCard extends StatelessWidget {
  final DayScheduleEntity day;

  const ScheduleDayCard({
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          day.date,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: day.entries.isEmpty
            ? const [EmptyDayScheduleTile()]
            : day.entries
                .map((entry) => ScheduleEntryTile(entry: entry))
                .toList(),
      ),
    );
  }
}
