import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/faculty_groups/domain/entity/faculty_groups_entity.dart';

@lazySingleton
class FacultyGroupsUsecase {
  final FacultyGroupsUsecase scheduleRepository;

  FacultyGroupsUsecase({required this.scheduleRepository});

  Future<Either<Failure, FacultyGroupsEntity>> getFacultyGroups() async => await scheduleRepository.getFacultyGroups();
}