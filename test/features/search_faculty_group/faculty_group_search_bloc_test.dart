import 'package:flutter_test/flutter_test.dart';
import 'package:wat_schedule/features/search_faculty_group/presentation/bloc/faculty_group_search_bloc.dart';

void main() {
  group('FacultyGroupSearchBloc', () {
    test('filters groups case-insensitively', () async {
      final FacultyGroupSearchBloc bloc = FacultyGroupSearchBloc(
        groups: const ['WCY 1', 'wcy 2', 'WEL 1'],
      );
      addTearDown(bloc.close);

      bloc.add(const FacultyGroupSearchEvent.queryChanged(query: 'WCY'));

      expect(
        await bloc.stream.first,
        const FacultyGroupSearchState.results(
          filteredGroups: ['WCY 1', 'wcy 2'],
        ),
      );
    });

    test('replaces the source groups', () async {
      final FacultyGroupSearchBloc bloc = FacultyGroupSearchBloc();
      addTearDown(bloc.close);

      bloc.add(
        const FacultyGroupSearchEvent.setGroups(groups: ['WEL 1', 'WEL 2']),
      );

      expect(
        await bloc.stream.first,
        const FacultyGroupSearchState.results(
          filteredGroups: ['WEL 1', 'WEL 2'],
        ),
      );
    });
  });
}
