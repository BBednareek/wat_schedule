import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wat_schedule/features/choose_department/presentation/widgets/theme_mode_switch_tile.dart';
import 'package:wat_schedule/features/theme_cubit/presentation/theme_cubit.dart';

void main() {
  testWidgets('describes its purpose and changes the application theme', (
    tester,
  ) async {
    HydratedBloc.storage = _MemoryStorage();
    final ThemeCubit themeCubit = ThemeCubit()..setLightTheme();
    addTearDown(themeCubit.close);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: themeCubit,
          child: const Scaffold(body: ThemeModeSwitchTile()),
        ),
      ),
    );

    expect(find.text('Ciemny motyw'), findsOneWidget);
    expect(
      find.text(
        'Zmień wygląd aplikacji między jasnym i ciemnym motywem.',
      ),
      findsOneWidget,
    );

    await tester.tap(find.byType(Switch));
    await tester.pump();

    expect(themeCubit.state.isDark, isTrue);
  });
}

class _MemoryStorage implements Storage {
  final Map<String, dynamic> _values = {};

  @override
  dynamic read(String key) => _values[key];

  @override
  Future<void> write(String key, dynamic value) async {
    _values[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    _values.remove(key);
  }

  @override
  Future<void> clear() async {
    _values.clear();
  }

  @override
  Future<void> close() async {}
}
