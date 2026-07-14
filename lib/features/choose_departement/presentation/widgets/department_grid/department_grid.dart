import 'package:flutter/material.dart';
import 'package:wat_schedule/core/constants/departements.dart';
import 'package:wat_schedule/features/choose_departement/presentation/widgets/department_grid/department_card.dart';

class DepartmentGrid extends StatelessWidget {
  final ValueChanged<Department> onDepartmentSelected;

  const DepartmentGrid({
    required this.onDepartmentSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _columnCountFor(constraints.maxWidth),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.92,
          ),
          itemCount: Departments().departments.length,
          itemBuilder: (context, index) {
            final department = Departments().departments[index];

            return DepartmentCard(
              name: department.name,
              imageUrl: department.imageUrl,
              onTap: () => onDepartmentSelected(department),
            );
          },
        );
      },
    );
  }

  int _columnCountFor(double width) {
    if (width >= 900) return 4;
    if (width >= 600) return 3;

    return 2;
  }
}
