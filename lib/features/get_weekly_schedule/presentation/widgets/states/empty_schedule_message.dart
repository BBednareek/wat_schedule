import 'package:flutter/material.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';

class EmptyScheduleMessage extends StatelessWidget {
  final String message;

  const EmptyScheduleMessage({
    this.message = 'Brak planu na ten tydzień.',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.scheduleColors.mutedText,
          ),
        ),
      ),
    );
  }
}
