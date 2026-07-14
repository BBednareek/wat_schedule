import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/features/choose_departement/presentation/widgets/department_grid/department_grid.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

class ChooseDepartement extends StatelessWidget {
  const ChooseDepartement({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wybierz wydział',
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Najpierw wybierz wydział, potem wybierzesz grupę, której plan chcesz wyświetlić.',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<ThemeCubit, ThemeEntity>(
                    builder: (context, state) {
                      return Switch.adaptive(
                        value: state.isDark,
                        onChanged: context.read<ThemeCubit>().toggleDarkMode,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: DepartmentGrid(
                onDepartmentSelected: (department) => context.push(
                  '/choose-faculty-group',
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
