import 'package:flutter/material.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';
import 'package:wat_schedule/core/extensions/entry_type_extension.dart';
import 'package:wat_schedule/features/get_weekly_schedule/domain/entities/schedule_entry_entity.dart';

class ScheduleEntryTile extends StatelessWidget {
  final ScheduleEntryEntity entry;

  const ScheduleEntryTile({
    required this.entry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String subject = entry.subject?.trim().isNotEmpty == true
        ? entry.subject!.trim()
        : entry.raw;

    return Semantics(
      container: true,
      label: 'Szczegóły zajęć: $subject',
      child: Card(
        margin: const EdgeInsets.fromLTRB(12, 6, 12, 8),
        color: context.scheduleColors.surfaceMuted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: context.colorScheme.primary.withAlpha(48),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _EntryHeader(subject: subject, type: entry.type),
              const SizedBox(height: 12),
              Divider(
                height: 1,
                color: context.scheduleColors.outline,
              ),
              const SizedBox(height: 12),
              if (entry.blockTime.isNotEmpty)
                _EntryDetail(
                  icon: Icons.schedule_outlined,
                  label: 'Godziny',
                  value: entry.blockTime,
                ),
              if (entry.room?.isNotEmpty == true)
                _EntryDetail(
                  icon: Icons.meeting_room_outlined,
                  label: 'Sala',
                  value: entry.room!,
                ),
              if (entry.building?.isNotEmpty == true)
                _EntryDetail(
                  icon: Icons.business_outlined,
                  label: 'Budynek',
                  value: entry.building!,
                ),
              if (entry.blockRaw.isNotEmpty)
                _EntryDetail(
                  icon: Icons.view_module_outlined,
                  label: 'Blok zajęć',
                  value: entry.blockRaw,
                  isLast: true,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EntryHeader extends StatelessWidget {
  final String subject;
  final EntryType? type;

  const _EntryHeader({required this.subject, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subject,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        if (type != null) ...[
          const SizedBox(height: 8),
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withAlpha(24),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                type!.displayName,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _EntryDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _EntryDetail({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18,
            color: context.scheduleColors.mutedText,
          ),
          const SizedBox(width: 9),
          SizedBox(
            width: 74,
            child: Text(label, style: context.textTheme.labelMedium),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
