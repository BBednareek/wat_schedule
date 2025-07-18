part of 'faculty_groups_bloc.dart';

@freezed
abstract class FacultyGroupsEvent with _$FacultyGroupsEvent {
  const factory FacultyGroupsEvent.getFacultyGroups() = _GetFacultyGroups;  
}
