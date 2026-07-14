import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/error/failures.dart';
import 'package:wat_schedule/features/get_faculty_groups/data/datasource/faculty_groups_datasource.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';

abstract class FacultyGroupsRepository {
  Future<Either<Failure, FacultyGroupsEntity>> getFacultyGroups(
      {required String department});
}

/// Implementation of the [FacultyGroupsRepository] that interacts with the remote data source to fetch faculty groups.
/// This class is annotated with [LazySingleton] to ensure a single instance is created and used throughout the application.
/// The [FacultyGroupsRepositoryImpl] class implements the [FacultyGroupsRepository] interface
/// and provides the actual implementation for fetching faculty groups from the remote data source.
@LazySingleton(as: FacultyGroupsRepository)
class FacultyGroupsRepositoryImpl implements FacultyGroupsRepository {
  final FacultyGroupsRemoteDatasource facultyGroupsRemoteDatasource;

  FacultyGroupsRepositoryImpl({required this.facultyGroupsRemoteDatasource});

  /// Fetches the faculty groups from the remote data source.
  /// Returns an [Either] type where the left side is a [Failure] in case of an error,
  /// and the right side is a [FacultyGroupsEntity] containing the groups by faculty.
  /// If an error occurs, it returns a [Failure] wrapped in the left side of the [Either].
  /// If the fetch is successful, it returns the [FacultyGroupsEntity] wrapped in the right side of the [Either].
  @override
  Future<Either<Failure, FacultyGroupsEntity>> getFacultyGroups(
      {required String department}) async {
    try {
      final FacultyGroupsEntity result =
          await facultyGroupsRemoteDatasource.getFacultyGroups(
        department: department,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.throwable(e));
    }
  }
}
