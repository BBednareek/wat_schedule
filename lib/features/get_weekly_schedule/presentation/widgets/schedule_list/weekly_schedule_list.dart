import 'package:flutter/material.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/daily_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/schedule_day_card.dart';

class WeeklyScheduleList extends StatelessWidget {
  final List<DayScheduleEntity> days;

  const WeeklyScheduleList({
    required this.days,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: days.length,
      itemBuilder: (context, index) {
        return ScheduleDayCard(day: days[index]);
      },
    );
  }
}
