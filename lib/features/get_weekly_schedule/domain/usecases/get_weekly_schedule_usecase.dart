import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/data/repository/get_weekly_schedule_repository.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/get_weekly_schedule_entity.dart';

@lazySingleton
class GetWeeklyScheduleUsecase {
  final GetWeeklyScheduleRepository getWeeklyScheduleRepository;

  GetWeeklyScheduleUsecase({required this.getWeeklyScheduleRepository});

  Future<Either<Failure, ScheduleEntity>> call({
    required String group,
    required String month,
    required String week,
    // ignore: non_constant_identifier_names
    required String start_date,
  }) async =>
      await getWeeklyScheduleRepository.getWeeklySchedule(
        group: group,
        month: month,
        week: week,
        start_date: start_date,
      );
}
