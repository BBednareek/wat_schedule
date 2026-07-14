import 'package:flutter/material.dart';

class EmptyDayScheduleTile extends StatelessWidget {
  const EmptyDayScheduleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Brak zajęć :-)'),
    );
  }
}
