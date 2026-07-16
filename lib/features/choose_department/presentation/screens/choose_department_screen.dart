import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/constants/app_routes.dart';
import 'package:wat_schedule/features/choose_department/presentation/widgets/department_grid/department_grid.dart';
import 'package:wat_schedule/features/choose_department/presentation/widgets/department_selection_header.dart';

class ChooseDepartmentScreen extends StatelessWidget {
  const ChooseDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DepartmentSelectionHeader(),
            Expanded(
              child: DepartmentGrid(
                onDepartmentSelected: (department) => context.push(
                  AppRoutes.chooseFacultyGroup,
                  extra: department,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
