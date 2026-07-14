import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_schedule_entity.freezed.dart';
part 'entry_schedule_entity.g.dart';

/// Represents a single entry in a schedule, which can be an event or activity.
/// Each entry contains details such as the raw string representation,
/// subject, type, room, building, and block information.
/// This entity is used to manage and display individual schedule entries in the application.
/// The `raw` field is a string that contains the raw data of the entry,
/// while the `subject`, `type`, `room`, and `building` fields provide additional context about the entry.
/// The `block_raw` and `block_time` fields represent the time block information
/// for the entry, which is essential for scheduling purposes.
@JsonEnum()
enum EntryType {
  @JsonValue('ć')
  c,
  @JsonValue('L')
  l,
  @JsonValue('r')
  r,
  @JsonValue('w')
  w,
  @JsonValue('E')
  E,
  @JsonValue('Ep')
  Ep,
  @JsonValue('Zp')
  Zp,
  @JsonValue('Zal')
  Zal,
  @JsonValue('Inne')
  Inne,

  unknown
}

@freezed
abstract class EntryEntity with _$EntryEntity {
  factory EntryEntity({
    required String raw,
    String? subject,
    EntryType? type,
    String? room,
    String? building,
    // ignore: non_constant_identifier_names
    required String block_raw,
    // ignore: non_constant_identifier_names
    required String block_time,
  }) = _EntryEntity;

  factory EntryEntity.fromJson(Map<String, dynamic> json) =>
      _$EntryEntityFromJson(json);
}
