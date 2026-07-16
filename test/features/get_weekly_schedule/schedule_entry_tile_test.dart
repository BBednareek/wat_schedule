import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wat_schedule/core/theme/theme.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/schedule_entry_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/presentation/widgets/schedule_list/schedule_entry_tile.dart';

void main() {
  testWidgets('shows clearly labelled details inside an entry card', (
    tester,
  ) async {
    final ScheduleEntryEntity entry = ScheduleEntryEntity(
      raw: 'Matematyka',
      subject: 'Matematyka dyskretna',
      type: EntryType.w,
      room: '101',
      building: 'G',
      blockRaw: 'Blok 1',
      blockTime: '08:00–09:30',
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: lightTheme(),
        home: Scaffold(body: ScheduleEntryTile(entry: entry)),
      ),
    );

    expect(find.byType(Card), findsOneWidget);
    expect(find.text('Matematyka dyskretna'), findsOneWidget);
    expect(find.text('Wykład'), findsOneWidget);
    expect(find.text('Godziny'), findsOneWidget);
    expect(find.text('08:00–09:30'), findsOneWidget);
    expect(find.text('Sala'), findsOneWidget);
    expect(find.text('101'), findsOneWidget);
    expect(find.text('Budynek'), findsOneWidget);
    expect(find.text('G'), findsOneWidget);
    expect(find.text('Blok zajęć'), findsOneWidget);
    expect(find.text('Blok 1'), findsOneWidget);
  });
}
