import 'package:flutter/material.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/app_bar/schedule_app_bar.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/weekly_schedule_body.dart';

class WeeklyScheduleScreen extends StatelessWidget {
  const WeeklyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ScheduleAppBar(),
      body: SafeArea(child: WeeklyScheduleBody()),
    );
  }
}
