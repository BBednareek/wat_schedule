import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/get_weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/app_bar/schedule_app_bar.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/weekly_schedule_list.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/weekly_schedule_list_skeleton.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/states/empty_schedule_message.dart';

class GetWeeklyScheduleScreen extends StatelessWidget {
  const GetWeeklyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScheduleAppBar(),
      body: SafeArea(
        child: BlocBuilder<GetWeeklyScheduleBloc, GetWeeklyScheduleState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const WeeklyScheduleListSkeleton();
            }

            if (state.message != null) {
              return Center(child: Text(state.message!));
            }

            final ScheduleEntity? schedules = state.schedules;

            if (schedules == null || schedules.schedule.isEmpty) {
              return const EmptyScheduleMessage();
            }

            return WeeklyScheduleList(days: schedules.schedule);
          },
        ),
      ),
    );
  }
}
