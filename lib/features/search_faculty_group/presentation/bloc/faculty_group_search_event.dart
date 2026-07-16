part of 'faculty_group_search_bloc.dart';

@freezed
abstract class FacultyGroupSearchEvent with _$FacultyGroupSearchEvent {
  const factory FacultyGroupSearchEvent.setGroups({
    required List<String> groups,
  }) = _SetGroups;

  const factory FacultyGroupSearchEvent.queryChanged({required String query}) =
      _QueryChanged;
}
