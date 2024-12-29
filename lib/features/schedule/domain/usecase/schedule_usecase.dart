import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/schedule/data/repository/schedule_repository.dart';

@lazySingleton
class ScheduleUsecase {
  final ScheduleRepository scheduleRepository;

  ScheduleUsecase({required this.scheduleRepository});

  Future<Either<Failure, Map<String, dynamic>>> get () async => await scheduleRepository.get();
}