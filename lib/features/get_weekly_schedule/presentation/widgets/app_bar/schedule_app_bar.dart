import 'package:flutter/material.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/app_bar/schedule_app_bar_title.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/app_bar/schedule_week_range.dart';

class ScheduleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScheduleAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      flexibleSpace: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ScheduleAppBarTitle(),
              SizedBox(height: 4),
              Center(child: ScheduleWeekRange()),
            ],
          ),
        ),
      ),
    );
  }
}
