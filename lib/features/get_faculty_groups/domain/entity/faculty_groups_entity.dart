import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty_groups_entity.freezed.dart';
part 'faculty_groups_entity.g.dart';

/// Represents a collection of faculty groups, where each faculty is associated with a list of groups.
/// This entity is used to encapsulate the data structure returned by the API for faculty groups.
/// The [FacultyGroupsEntity] class is annotated with [freezed] to generate immutable data classes
/// and [json_serializable] to handle JSON serialization and deserialization.
/// The [FacultyGroupsEntity] class contains a single field, [groups_by_faculty],
/// which is a map where the key is a faculty name and the value is a list of group names.
@freezed
abstract class FacultyGroupsEntity with _$FacultyGroupsEntity {
  factory FacultyGroupsEntity(
      // ignore: non_constant_identifier_names
      {required List<String> groups_by_department}) = _FacultyGroupsEntity;
  factory FacultyGroupsEntity.fromJson(Map<String, dynamic> json) =>
      _$FacultyGroupsEntityFromJson(json);
}
