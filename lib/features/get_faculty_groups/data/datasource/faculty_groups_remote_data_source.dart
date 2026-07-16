import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/constants/api_paths.dart';
import 'package:wat_schedule/core/network/factory/dio_factory.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';

abstract class FacultyGroupsRemoteDataSource {
  Future<FacultyGroupsEntity> getFacultyGroups({required String department});
}

/// Implementation of the [FacultyGroupsRemoteDataSource] that fetches faculty groups from a remote API.
/// Uses [DioFactory] for network requests and handles exceptions.
/// This class is annotated with [LazySingleton] to ensure a single instance is created and used throughout the application.
/// The [FacultyGroupsRemoteDataSourceImpl] class implements the [FacultyGroupsRemoteDataSource] interface
/// and provides the actual implementation for fetching faculty groups.

@LazySingleton(as: FacultyGroupsRemoteDataSource)
class FacultyGroupsRemoteDataSourceImpl
    implements FacultyGroupsRemoteDataSource {
  final DioFactory dioFactory;

  FacultyGroupsRemoteDataSourceImpl({required this.dioFactory});

  /// Fetches the faculty groups from the remote API.
  /// Returns a [FacultyGroupsEntity] containing the groups by faculty.
  /// If an error occurs, it throws an exception handled by the [DioFactory].
  @override
  Future<FacultyGroupsEntity> getFacultyGroups(
      {required String department}) async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get('${ApiPaths.facultyGroups}/$department');
      return FacultyGroupsEntity.fromJson(result);
    } catch (e, st) {
      throw dioFactory.handleException(e, stackTrace: st);
    }
  }
}
