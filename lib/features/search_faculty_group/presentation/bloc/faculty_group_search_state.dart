part of 'faculty_group_search_bloc.dart';

@freezed
abstract class FacultyGroupSearchState with _$FacultyGroupSearchState {
  const factory FacultyGroupSearchState.results(
      {required List<String> filteredGroups}) = _SearchResults;
}
