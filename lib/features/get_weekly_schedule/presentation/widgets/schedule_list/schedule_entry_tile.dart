import 'package:flutter/material.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/core/extensions/entry_type_extension.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entites/entry_schedule_entity.dart';

class ScheduleEntryTile extends StatelessWidget {
  final EntryEntity entry;

  const ScheduleEntryTile({
    required this.entry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ScheduleEntryMeta(entry: entry),
            const SizedBox(height: 4),
            _ScheduleEntrySubject(entry: entry),
          ],
        ),
      ),
    );
  }
}

class _ScheduleEntryMeta extends StatelessWidget {
  final EntryEntity entry;

  const _ScheduleEntryMeta({required this.entry});

  @override
  Widget build(BuildContext context) {
    final String location = _location;
    final TextStyle? metaStyle = context.textTheme.bodySmall?.copyWith(
      color: context.scheduleColors.mutedText,
    );

    return Row(
      children: [
        if (entry.block_raw.isNotEmpty)
          Text(
            entry.block_raw,
            style: metaStyle,
          ),
        if (entry.block_raw.isNotEmpty && entry.block_time.isNotEmpty)
          const SizedBox(width: 16),
        if (entry.block_time.isNotEmpty)
          Text(
            entry.block_time,
            style: metaStyle,
          ),
        const Spacer(),
        if (location.isNotEmpty)
          Flexible(
            child: Text(
              location,
              style: metaStyle?.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              textAlign: TextAlign.right,
            ),
          ),
      ],
    );
  }

  String get _location {
    return [
      entry.room,
      entry.building,
    ].whereType<String>().where((value) => value.isNotEmpty).join('/');
  }
}

class _ScheduleEntrySubject extends StatelessWidget {
  final EntryEntity entry;

  const _ScheduleEntrySubject({required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      children: [
        Expanded(
          child: Text(
            entry.subject ?? entry.raw,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (entry.type != null) ...[
          const SizedBox(width: 8),
          Text(
            entry.type!.display,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ],
    );
  }
}
