import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/data/datasource/get_weekly_schedule_datasource.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/get_weekly_schedule_entity.dart';

abstract class GetWeeklyScheduleRepository {
  Future<Either<Failure, ScheduleEntity>> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    // ignore: non_constant_identifier_names
    required String start_date,
  });
}

/// Implementation of the GetWeeklyScheduleRepository
/// that uses a datasource to fetch the weekly schedule.
/// It handles errors by returning a Failure wrapped in an Either type.
@LazySingleton(as: GetWeeklyScheduleRepository)
class GetWeeklyScheduleRepositoryImpl implements GetWeeklyScheduleRepository {
  final GetWeeklyScheduleDatasource getWeeklyScheduleDatasource;

  GetWeeklyScheduleRepositoryImpl({required this.getWeeklyScheduleDatasource});

  /// Fetches the weekly schedule for a given group, month, week, and start date.
  /// Returns a [Right] with the [ScheduleEntity] on success,
  /// or a [Left] with a [Failure] on error.
  @override
  Future<Either<Failure, ScheduleEntity>> getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    // ignore: non_constant_identifier_names
    required String start_date,
  }) async {
    try {
      final ScheduleEntity result =
          await getWeeklyScheduleDatasource.getWeeklySchedule(
        group: group,
        month: month,
        week: week,
        start_date: start_date,
      );

      return Right(result);
    } catch (e) {
      return Left(Failure.throwable(e));
    }
  }
}
