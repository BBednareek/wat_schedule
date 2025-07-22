import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/constants/pathes.dart';
import 'package:wat_schedule/core/network/factory/dio_factory.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/daily_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/get_weekly_schedule_entity.dart';

abstract class GetWeeklyScheduleDatasource {
  Future<ScheduleEntity> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    // ignore: non_constant_identifier_names
    required String start_date,
  });
}

/// Implementation of the [GetWeeklyScheduleDatasource] that fetches weekly schedule data from a remote source.
/// It uses the [DioFactory] to make HTTP requests.
/// The method [getWeeklySchedule] takes parameters such as group, month, week, and start_date to fetch the schedule.
/// It returns a [ScheduleEntity] which contains the weekly schedule data.
/// If an error occurs during the request, it throws an exception handled by the [DioFactory
@LazySingleton(as: GetWeeklyScheduleDatasource)
class GetWeeklyScheduleImpl implements GetWeeklyScheduleDatasource {
  final DioFactory dioFactory;

  GetWeeklyScheduleImpl({required this.dioFactory});

  /// Fetches the weekly schedule for a specific group, month, week, and start date.
  @override
  Future<ScheduleEntity> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    // ignore: non_constant_identifier_names
    required String start_date,
  }) async {
    try {
      final String url = Pathes.getWeeklySchedule(
        group: group,
        month: month,
        week: week,
        start_date: start_date,
      );
      final Map<String, dynamic> result = await dioFactory.get(url);

      return ScheduleEntity(
        schedule: result.values
            .expand((e) => (e as List<dynamic>).map((day) =>
                DayScheduleEntity.fromJson(day as Map<String, dynamic>)))
            .toList(),
      );
    } catch (e, st) {
      throw dioFactory.handleException(e, stackTrace: st);
    }
  }
}
