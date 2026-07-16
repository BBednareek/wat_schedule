import 'package:flutter/material.dart';

class FacultyGroupsHeader extends StatelessWidget {
  final String departmentName;

  const FacultyGroupsHeader({
    required this.departmentName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          departmentName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
