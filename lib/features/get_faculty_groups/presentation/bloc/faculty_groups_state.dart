part of 'faculty_groups_bloc.dart';

@freezed
abstract class FacultyGroupsState with _$FacultyGroupsState {
  const factory FacultyGroupsState.loading() = _Loading;
  const factory FacultyGroupsState.loaded() = _Loaded;
  const factory FacultyGroupsState.error({required String errorMessage}) = _Error;
}
