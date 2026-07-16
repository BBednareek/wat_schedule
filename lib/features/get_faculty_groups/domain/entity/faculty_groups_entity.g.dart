// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faculty_groups_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FacultyGroupsEntity _$FacultyGroupsEntityFromJson(Map<String, dynamic> json) =>
    _FacultyGroupsEntity(
      groupsByDepartment: (json['groups_by_department'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FacultyGroupsEntityToJson(
        _FacultyGroupsEntity instance) =>
    <String, dynamic>{
      'groups_by_department': instance.groupsByDepartment,
    };
