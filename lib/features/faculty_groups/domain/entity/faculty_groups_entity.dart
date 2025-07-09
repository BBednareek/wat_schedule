import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty_groups_entity.freezed.dart';
part 'faculty_groups_entity.g.dart';

@freezed
class FacultyGroupsEntity with _$FacultyGroupsEntity {
  factory FacultyGroupsEntity({required String group}) = _FacultyGroupsEntity;
  factory FacultyGroupsEntity.fromJson(Map<String, dynamic> json) => _$FacultyGroupsEntityFromJson(json);
}