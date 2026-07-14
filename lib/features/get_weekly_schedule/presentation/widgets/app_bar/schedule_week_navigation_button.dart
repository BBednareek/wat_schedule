import 'package:flutter/material.dart';

class ScheduleWeekNavigationButton extends StatelessWidget {
  final bool isForward;
  final VoidCallback onPressed;

  const ScheduleWeekNavigationButton({
    required this.isForward,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isForward ? Icons.arrow_forward : Icons.arrow_back),
      color: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      tooltip: isForward ? 'Następny tydzień' : 'Poprzedni tydzień',
    );
  }
}
