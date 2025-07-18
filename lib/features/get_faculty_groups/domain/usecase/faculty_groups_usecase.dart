import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_faculty_groups/data/repository/faculty_groups_repository.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';

@lazySingleton
class FacultyGroupsUsecase {
  final FacultyGroupsRepository scheduleRepository;

  FacultyGroupsUsecase({required this.scheduleRepository});

  Future<Either<Failure, FacultyGroupsEntity>> call() async =>
      await scheduleRepository.getFacultyGroups();
}
