import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/constants/pathes.dart';
import 'package:wat_schedule/core/network/factory/dio_factory.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';

abstract class FacultyGroupsRemoteDatasource {
  Future<FacultyGroupsEntity> getFacultyGroups();
}

/// Implementation of the [FacultyGroupsRemoteDatasource] that fetches faculty groups from a remote API.
/// Uses [DioFactory] for network requests and handles exceptions.
/// This class is annotated with [LazySingleton] to ensure a single instance is created and used throughout the application.
/// The [FacultyGroupsRemoteDatasourceImpl] class implements the [FacultyGroupsRemoteDatasource] interface
/// and provides the actual implementation for fetching faculty groups.

@LazySingleton(as: FacultyGroupsRemoteDatasource)
class FacultyGroupsRemoteDatasourceImpl
    implements FacultyGroupsRemoteDatasource {
  final DioFactory dioFactory;

  FacultyGroupsRemoteDatasourceImpl({required this.dioFactory});

  /// Fetches the faculty groups from the remote API.
  /// Returns a [FacultyGroupsEntity] containing the groups by faculty.
  /// If an error occurs, it throws an exception handled by the [DioFactory].
  @override
  Future<FacultyGroupsEntity> getFacultyGroups() async {
    try {
      final Map<String, dynamic> result =
          await dioFactory.get(Pathes.getFacultyGroups);
      return FacultyGroupsEntity.fromJson(result);
    } catch (e, st) {
      throw dioFactory.handleException(e, stackTrace: st);
    }
  }
}
