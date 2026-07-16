import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

class ThemeModeSwitchTile extends StatelessWidget {
  const ThemeModeSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeEntity>(
      builder: (context, state) {
        return SwitchListTile.adaptive(
          value: state.isDark,
          contentPadding: EdgeInsets.zero,
          title:
              Text('Zmień na ${state.isDark ? 'jasny motyw' : 'ciemny motyw'}'),
          subtitle: const Text(
            'Zmień wygląd aplikacji między jasnym i ciemnym motywem.',
          ),
          secondary: Icon(
            state.isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          ),
          onChanged: context.read<ThemeCubit>().toggleDarkMode,
        );
      },
    );
  }
}
