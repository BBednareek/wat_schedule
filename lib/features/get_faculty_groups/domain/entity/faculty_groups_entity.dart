// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty_groups_entity.freezed.dart';
part 'faculty_groups_entity.g.dart';

/// Represents a collection of faculty groups, where each faculty is associated with a list of groups.
/// This entity is used to encapsulate the data structure returned by the API for faculty groups.
/// The [FacultyGroupsEntity] class is annotated with [freezed] to generate immutable data classes
/// and [json_serializable] to handle JSON serialization and deserialization.
/// The [FacultyGroupsEntity] class contains the groups returned for a department.
@freezed
abstract class FacultyGroupsEntity with _$FacultyGroupsEntity {
  factory FacultyGroupsEntity({
    @JsonKey(name: 'groups_by_department')
    required List<String> groupsByDepartment,
  }) = _FacultyGroupsEntity;
  factory FacultyGroupsEntity.fromJson(Map<String, dynamic> json) =>
      _$FacultyGroupsEntityFromJson(json);
}
