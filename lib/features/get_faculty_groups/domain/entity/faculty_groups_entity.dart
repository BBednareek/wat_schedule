import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty_groups_entity.freezed.dart';
part 'faculty_groups_entity.g.dart';

@freezed
abstract class FacultyGroupsEntity with _$FacultyGroupsEntity {
  factory FacultyGroupsEntity(
          // ignore: non_constant_identifier_names
          {required Map<String, List<String>> groups_by_faculty}) =
      _FacultyGroupsEntity;
  factory FacultyGroupsEntity.fromJson(Map<String, dynamic> json) =>
      _$FacultyGroupsEntityFromJson(json);
}
