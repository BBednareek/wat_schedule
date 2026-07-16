import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wat_schedule/core/constants/app_routes.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/core/theme/theme.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/bloc/weekly_schedule_bloc.dart';
import 'package:wat_schedule/features/theme_cubit/entity/theme_entity.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

void showScheduleSettingsSheet({required BuildContext context}) {
  final ThemeCubit themeCubit = context.read<ThemeCubit>();
  final WeeklyScheduleBloc weeklyScheduleBloc =
      context.read<WeeklyScheduleBloc>();

  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) {
      return BlocProvider.value(
        value: themeCubit,
        child: BlocBuilder<ThemeCubit, ThemeEntity>(
          builder: (context, themeState) {
            final Brightness brightness = themeState.isSystem
                ? MediaQuery.platformBrightnessOf(context)
                : themeState.isDark
                    ? Brightness.dark
                    : Brightness.light;
            final ThemeData sheetTheme =
                brightness == Brightness.dark ? darkTheme() : lightTheme();

            return AnimatedTheme(
              data: sheetTheme,
              duration: const Duration(milliseconds: 200),
              child: Material(
                color: sheetTheme.colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: ScheduleSettingsSheet(
                  onChangeGroup: () {
                    weeklyScheduleBloc.add(
                      const WeeklyScheduleEvent.reset(),
                    );
                    Navigator.of(sheetContext).pop();
                    context.go(AppRoutes.chooseDepartment);
                  },
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

class ScheduleSettingsSheet extends StatelessWidget {
  final VoidCallback onChangeGroup;

  const ScheduleSettingsSheet({
    required this.onChangeGroup,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ustawienia',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onChangeGroup,
              child: const Text('Zmień grupę wydziałową'),
            ),
            const SizedBox(height: 12),
            BlocBuilder<ThemeCubit, ThemeEntity>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SwitchListTile(
                      value: state.isSystem,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Motyw systemowy'),
                      secondary: const Icon(Icons.settings_suggest_outlined),
                      onChanged: (value) => value
                          ? context.read<ThemeCubit>().setSystemTheme()
                          : context.read<ThemeCubit>().setLightTheme(),
                    ),
                    SwitchListTile(
                      value: state.isDark,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Ciemny motyw'),
                      secondary: const Icon(Icons.dark_mode_outlined),
                      onChanged: state.isSystem
                          ? null
                          : context.read<ThemeCubit>().toggleDarkMode,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
