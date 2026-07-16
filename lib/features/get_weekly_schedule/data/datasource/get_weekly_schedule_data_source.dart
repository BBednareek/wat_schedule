import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/constants/api_paths.dart';
import 'package:wat_schedule/core/network/error/handler.dart';
import 'package:wat_schedule/core/network/factory/dio_factory.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/day_schedule_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';

abstract class GetWeeklyScheduleDataSource {
  Future<WeeklyScheduleEntity> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    required String startDate,
  });
}

/// Implementation of the [GetWeeklyScheduleDataSource] that fetches weekly schedule data from a remote source.
/// It uses the [DioFactory] to make HTTP requests.
/// The method [getWeeklySchedule] takes parameters such as group, month, week, and startDate to fetch the schedule.
/// It returns a [WeeklyScheduleEntity] which contains the weekly schedule data.
/// If an error occurs during the request, it throws an exception handled by the [DioFactory
@LazySingleton(as: GetWeeklyScheduleDataSource)
class GetWeeklyScheduleDataSourceImpl
    with ErrorHandling
    implements GetWeeklyScheduleDataSource {
  final DioFactory dioFactory;

  GetWeeklyScheduleDataSourceImpl({required this.dioFactory});

  /// Fetches the weekly schedule for a specific group, month, week, and start date.
  @override
  Future<WeeklyScheduleEntity> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    required String startDate,
  }) async {
    try {
      final String url = ApiPaths.weeklySchedule(
        group: group,
        month: month,
        week: week,
        startDate: startDate,
      );
      final Map<String, dynamic> result = await dioFactory.get(url);

      return WeeklyScheduleEntity(
        days: result.values
            .expand((e) => (e as List<dynamic>).map((day) =>
                DayScheduleEntity.fromJson(day as Map<String, dynamic>)))
            .toList(),
      );
    } catch (e, st) {
      throw handleException(e, stackTrace: st);
    }
  }
}
