import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_faculty_groups/data/datasource/faculty_groups_datasource.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';

abstract class FacultyGroupsRepository {
  Future<Either<Failure, FacultyGroupsEntity>> getFacultyGroups();
}

@LazySingleton(as: FacultyGroupsRepository)
class FacultyGroupsRepositoryImpl implements FacultyGroupsRepository{
  final FacultyGroupsRemoteDatasource facultyGroupsRemoteDatasource;

  FacultyGroupsRepositoryImpl({required this.facultyGroupsRemoteDatasource});

  @override
  Future<Either<Failure, FacultyGroupsEntity>> getFacultyGroups() async {
    try {
      final FacultyGroupsEntity result = await facultyGroupsRemoteDatasource.getFacultyGroups();
      return Right(result);
    } catch (e) {
      return Left(Failure.throwable(e));
    }
  }
}