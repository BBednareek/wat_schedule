import 'package:flutter/material.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/appbar_daterange.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/appbar_title_row.dart';

class ScheduleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScheduleAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBarTitleRow(),
              SizedBox(height: 8),
              AppBarDateRange(),
            ],
          ),
        ),
      ),
    );
  }
}
