import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

void showFiltersBottomSheet({required BuildContext context}) {
  final theme = Theme.of(context);
  final textColor = theme.colorScheme.onSurface;

  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ustawienia',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.go('/main');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                child: const Text('Zmień grupę wydziałową'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<ThemeCubit, ThemeEntity>(
                    builder: (context, state) => Switch(
                      value: state.isDark,
                      onChanged: (value) =>
                          context.read<ThemeCubit>().changeTheme(false, value),
                    ),
                  ),
                  const Text(
                    'Zmiana motywu',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
