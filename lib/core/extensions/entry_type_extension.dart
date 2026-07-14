import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/entry_schedule_entity.dart';

extension EntryTypeExtension on EntryType {
  String get display {
    switch (this) {
      case EntryType.c:
        return 'ć';
      case EntryType.l:
        return 'L';
      case EntryType.r:
        return 'r';
      case EntryType.w:
        return 'w';
      case EntryType.E:
        return 'E';
      case EntryType.Ep:
        return 'Ep';
      case EntryType.Zp:
        return 'Zp';
      case EntryType.Inne:
        return 'Inne';
      default:
        return '';
    }
  }
}
