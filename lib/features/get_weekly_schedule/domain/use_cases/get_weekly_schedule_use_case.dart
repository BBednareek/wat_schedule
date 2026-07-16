import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_weekly_schedule/data/repository/get_weekly_schedule_repository.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/weekly_schedule_entity.dart';

@lazySingleton
class GetWeeklyScheduleUseCase {
  final GetWeeklyScheduleRepository getWeeklyScheduleRepository;

  GetWeeklyScheduleUseCase({required this.getWeeklyScheduleRepository});

  Future<Either<Failure, WeeklyScheduleEntity>> call({
    required String group,
    required String month,
    required String week,
    required String startDate,
  }) =>
      getWeeklyScheduleRepository.getWeeklySchedule(
        group: group,
        month: month,
        week: week,
        startDate: startDate,
      );
}
