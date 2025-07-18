// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faculty_groups_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FacultyGroupsEntity _$FacultyGroupsEntityFromJson(Map<String, dynamic> json) =>
    _FacultyGroupsEntity(
      groups_by_faculty:
          (json['groups_by_faculty'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$FacultyGroupsEntityToJson(
        _FacultyGroupsEntity instance) =>
    <String, dynamic>{
      'groups_by_faculty': instance.groups_by_faculty,
    };
