import 'package:flutter/material.dart';

/// A widget that displays a loaded tile for a faculty group.
class LoadedTile extends StatelessWidget {
  final String faculty;
  final List<String> groups;
  const LoadedTile({
    super.key,
    required this.faculty,
    required this.groups,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: Text(faculty));
  }
}
