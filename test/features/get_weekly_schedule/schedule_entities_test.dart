import 'package:flutter_test/flutter_test.dart';
import 'package:wat_schedule/core/extensions/schedule_extensions.dart';
import 'package:wat_schedule/features/get_faculty_groups/domain/entity/faculty_groups_entity.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/schedule_entry_entity.dart';

void main() {
  test('schedule parameters use the month in which the week starts', () {
    final ScheduleRequestParameters parameters =
        ScheduleRequestParameters.forDate(DateTime(2026, 7, 2));

    expect(parameters.month, 'czerwiec');
    expect(parameters.week, '29VI');
    expect(parameters.startDate, '29.06.2026');
  });

  test('faculty groups preserve the API snake_case key', () {
    final FacultyGroupsEntity entity = FacultyGroupsEntity.fromJson(
      const {
        'groups_by_department': ['WCY 1'],
      },
    );

    expect(entity.groupsByDepartment, ['WCY 1']);
    expect(entity.toJson()['groups_by_department'], ['WCY 1']);
  });

  test('schedule entry maps API keys to Dart-style field names', () {
    final ScheduleEntryEntity entry = ScheduleEntryEntity.fromJson(
      const {
        'raw': 'Matematyka',
        'block_raw': '1',
        'block_time': '08:00-09:30',
      },
    );

    expect(entry.blockRaw, '1');
    expect(entry.blockTime, '08:00-09:30');
    expect(entry.toJson()['block_raw'], '1');
    expect(entry.toJson()['block_time'], '08:00-09:30');
  });
}
