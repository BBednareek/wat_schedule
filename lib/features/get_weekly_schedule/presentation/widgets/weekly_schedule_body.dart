import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/weekly_schedule_list.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/weekly_schedule_list_skeleton.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/states/empty_schedule_message.dart';

class WeeklyScheduleBody extends StatelessWidget {
  const WeeklyScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeeklyScheduleBloc, WeeklyScheduleState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const WeeklyScheduleListSkeleton();
        }

        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }

        final WeeklyScheduleEntity? schedule = state.schedule;

        if (schedule == null || schedule.days.isEmpty) {
          return const EmptyScheduleMessage();
        }

        return WeeklyScheduleList(days: schedule.days);
      },
    );
  }
}
