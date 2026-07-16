import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/data/datasource/get_weekly_schedule_data_source.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';

abstract class GetWeeklyScheduleRepository {
  Future<Either<Failure, WeeklyScheduleEntity>> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    required String startDate,
  });
}

/// Implementation of the GetWeeklyScheduleRepository
/// that uses a data source to fetch the weekly schedule.
/// It handles errors by returning a Failure wrapped in an Either type.
@LazySingleton(as: GetWeeklyScheduleRepository)
class GetWeeklyScheduleRepositoryImpl implements GetWeeklyScheduleRepository {
  final GetWeeklyScheduleDataSource getWeeklyScheduleDataSource;

  GetWeeklyScheduleRepositoryImpl({required this.getWeeklyScheduleDataSource});

  /// Fetches the weekly schedule for a given group, month, week, and start date.
  /// Returns a [Right] with the [WeeklyScheduleEntity] on success,
  /// or a [Left] with a [Failure] on error.
  @override
  Future<Either<Failure, WeeklyScheduleEntity>> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    required String startDate,
  }) async {
    try {
      final WeeklyScheduleEntity result =
          await getWeeklyScheduleDataSource.getWeeklySchedule(
        group: group,
        month: month,
        week: week,
        startDate: startDate,
      );

      return Right(result);
    } catch (e) {
      return Left(Failure.throwable(e));
    }
  }
}
