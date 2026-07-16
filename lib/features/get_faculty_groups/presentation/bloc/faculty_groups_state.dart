part of 'faculty_groups_bloc.dart';

/// State for faculty groups.
/// It represents the different states of the faculty groups
/// such as loading, loaded with data, or error with a errorMessage.
@freezed
abstract class FacultyGroupsState with _$FacultyGroupsState {
  const factory FacultyGroupsState.loading() = FacultyGroupsLoading;
  const factory FacultyGroupsState.loaded({
    required FacultyGroupsEntity entity,
    String? selectedGroupName,
  }) = FacultyGroupsLoaded;
  const factory FacultyGroupsState.error({required String errorMessage}) =
      FacultyGroupsError;
}
