import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_faculty_groups/data/repository/faculty_groups_repository.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';

/// Use case for fetching faculty groups
/// from the repository.
/// This use case is responsible for calling the repository
/// and returning the result as an Either type.
/// If the call is successful, it returns a FacultyGroupsEntity.
/// If it fails, it returns a Failure.
@lazySingleton
class GetFacultyGroupsUseCase {
  final FacultyGroupsRepository facultyGroupsRepository;

  GetFacultyGroupsUseCase({required this.facultyGroupsRepository});

  Future<Either<Failure, FacultyGroupsEntity>> call({
    required String department,
  }) =>
      facultyGroupsRepository.getFacultyGroups(department: department);
}
