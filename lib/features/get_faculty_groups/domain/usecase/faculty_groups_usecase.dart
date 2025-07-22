import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_faculty_groups/data/repository/faculty_groups_repository.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';

/// Usecase for fetching faculty groups
/// from the repository.
/// This usecase is responsible for calling the repository
/// and returning the result as an Either type.
/// If the call is successful, it returns a FacultyGroupsEntity.
/// If it fails, it returns a Failure.
@lazySingleton
class FacultyGroupsUsecase {
  final FacultyGroupsRepository scheduleRepository;

  FacultyGroupsUsecase({required this.scheduleRepository});

  Future<Either<Failure, FacultyGroupsEntity>> call() async =>
      await scheduleRepository.getFacultyGroups();
}
