import 'package:flutter/material.dart';

class EmptyScheduleMessage extends StatelessWidget {
  const EmptyScheduleMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Brak zajęć na dziś :-)',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
