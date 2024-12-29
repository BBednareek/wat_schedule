import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/schedule/data/datasource/schedule_datasource.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, Map<String, dynamic>>> get();
}

@LazySingleton(as: ScheduleRepository)
class ScheduleRepositoryImpl implements ScheduleRepository{
  final ScheduleRemoteDatasource scheduleRemoteDatasource;

  ScheduleRepositoryImpl({required this.scheduleRemoteDatasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> get() async {
    try {
      final Map<String, dynamic> result = await scheduleRemoteDatasource.get();
      return Right(result);
    } catch (e) {
      return Left(Failure.throwable(e));
    }
  }
}