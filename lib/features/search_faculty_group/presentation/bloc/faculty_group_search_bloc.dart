import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty_group_search_bloc.freezed.dart';
part 'faculty_group_search_event.dart';
part 'faculty_group_search_state.dart';

class FacultyGroupSearchBloc
    extends Bloc<FacultyGroupSearchEvent, FacultyGroupSearchState> {
  List<String> _groups;

  FacultyGroupSearchBloc({List<String> groups = const []})
      : _groups = List.unmodifiable(groups),
        super(FacultyGroupSearchState.results(filteredGroups: groups)) {
    on<_SetGroups>(_setGroups);
    on<_QueryChanged>(_filterGroups);
  }

  void _setGroups(_SetGroups event, Emitter<FacultyGroupSearchState> emit) {
    _groups = List.unmodifiable(event.groups);
    emit(FacultyGroupSearchState.results(filteredGroups: _groups));
  }

  void _filterGroups(
      _QueryChanged event, Emitter<FacultyGroupSearchState> emit) {
    final String query = event.query.trim().toLowerCase();
    final List<String> searchResults = _groups
        .where((group) => group.toLowerCase().contains(query))
        .toList(growable: false);

    emit(state.copyWith(filteredGroups: searchResults));
  }
}
