import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/features/search_faculty_group/presentation/bloc/faculty_group_search_bloc.dart';

class FacultyGroupSearchField extends StatelessWidget {
  const FacultyGroupSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Wyszukaj grupę',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: (query) => context.read<FacultyGroupSearchBloc>().add(
            FacultyGroupSearchEvent.queryChanged(query: query),
          ),
    );
  }
}
