import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/schedule_entry_entity.dart';

extension EntryTypeExtension on EntryType {
  String get displayName {
    switch (this) {
      case EntryType.c:
        return 'Ćwiczenia';
      case EntryType.l:
        return 'Laboratorium';
      case EntryType.r:
        return 'Repetytorium';
      case EntryType.w:
        return 'Wykład';
      case EntryType.E:
        return 'Egzamin';
      case EntryType.Ep:
        return 'Egzamin poprawkowy';
      case EntryType.Zp:
        return 'Zaliczenie poprawkowe';
      case EntryType.Zal:
        return 'Zaliczenie';
      case EntryType.Inne:
        return 'Inne zajęcia';
      case EntryType.unknown:
        return 'Nieznany typ';
    }
  }
}
