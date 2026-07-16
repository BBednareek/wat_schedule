part of 'faculty_groups_bloc.dart';

/// Event for fetching faculty groups.
/// This event is triggered to initiate the process of retrieving
/// faculty groups from the repository.
@freezed
abstract class FacultyGroupsEvent with _$FacultyGroupsEvent {
  const factory FacultyGroupsEvent.load({required String department}) =
      _LoadFacultyGroups;
  const factory FacultyGroupsEvent.selectGroup({required String groupName}) =
      _SelectGroup;
}
