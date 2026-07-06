part of 'faculty_groups_bloc.dart';

/// State for faculty groups.
/// It represents the different states of the faculty groups
/// such as loading, loaded with data, or error with a message.
@freezed
abstract class FacultyGroupsState with _$FacultyGroupsState {
  const factory FacultyGroupsState.loading() = LoadingGroups;
  const factory FacultyGroupsState.loaded({
    required FacultyGroupsEntity entity,
    String? selectedGroupNam,
  }) = LoadedGroups;
  const factory FacultyGroupsState.error({required String errorMessage}) =
      ErrorGroups;
}
