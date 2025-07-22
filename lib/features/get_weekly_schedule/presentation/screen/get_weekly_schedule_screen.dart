import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/core/extensions/entry_type_extension.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/daily_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/get_weekly_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/get_weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_app_bar.dart';

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
              return const Center(child: CircularProgressIndicator());
            }

            if (state.message != null) {
              return Center(child: Text(state.message!));
            }

            final ScheduleEntity? schedules = state.schedules;

            if (schedules == null || schedules.schedule.isEmpty) {
              return const Center(child: Text('Brak planu na ten tydzień.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: schedules.schedule.length,
              itemBuilder: (context, index) {
                final DayScheduleEntity day = schedules.schedule[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ExpansionTile(
                    title: Text(
                      day.date,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    children: day.entries.isEmpty
                        ? [
                            const ListTile(
                              title: Text('Brak zajęć :-)'),
                            ),
                          ]
                        : day.entries.map((entry) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        if (entry.block_raw.isNotEmpty)
                                          Text(
                                            entry.block_raw,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        if (entry.block_raw.isNotEmpty &&
                                            entry.block_time.isNotEmpty)
                                          const SizedBox(width: 16),
                                        if (entry.block_time.isNotEmpty)
                                          Text(
                                            entry.block_time,
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        const Spacer(),
                                        if (entry.room != null ||
                                            entry.building != null)
                                          Expanded(
                                            child: Text(
                                              [
                                                if (entry.room != null)
                                                  entry.room,
                                                if (entry.building != null)
                                                  entry.building,
                                              ]
                                                  .where((e) =>
                                                      e != null && e.isNotEmpty)
                                                  .join('/'),
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          entry.subject ?? entry.raw,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        if (entry.type != null) ...[
                                          const SizedBox(width: 8),
                                          Text(
                                            entry.type!.display,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
