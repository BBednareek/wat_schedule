import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/factory/dio_factory.dart';
import 'package:wat_schedule/features/faculty_groups/domain/entity/faculty_groups_entity.dart';

abstract class FacultyGroupsRemoteDatasource {
  Future<FacultyGroupsEntity> getFacultyGroups(); 
}

@LazySingleton(as: FacultyGroupsRemoteDatasource)
class FacultyGroupsRemoteDatasourceImpl implements FacultyGroupsRemoteDatasource {
  final DioFactory dioFactory;

  FacultyGroupsRemoteDatasourceImpl({required this.dioFactory});

  @override
  Future<FacultyGroupsEntity> getFacultyGroups() async {
    try {
      return FacultyGroupsEntity(group: '');
    } catch (e, st) {
      throw dioFactory.handleException(e, stackTrace: st);
    }
  } 
}

