import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeeklyScheduleListSkeleton extends StatelessWidget {
  const WeeklyScheduleListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _ScheduleDayCardSkeleton(entryCount: index.isEven ? 3 : 2),
          );
        },
      ),
    );
  }
}

class _ScheduleDayCardSkeleton extends StatelessWidget {
  final int entryCount;

  const _ScheduleDayCardSkeleton({required this.entryCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Expanded(child: Bone.text(width: 140)),
                Bone.icon(size: 22),
              ],
            ),
            const SizedBox(height: 16),
            ...List.generate(
              entryCount,
              (index) => const Padding(
                padding: EdgeInsets.only(bottom: 14),
                child: _ScheduleEntrySkeleton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleEntrySkeleton extends StatelessWidget {
  const _ScheduleEntrySkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Bone.text(width: 44),
            SizedBox(width: 16),
            Bone.text(width: 86),
            Spacer(),
            Bone.text(width: 72),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: Bone.text(width: 180)),
            SizedBox(width: 12),
            Bone.text(width: 28),
          ],
        ),
      ],
    );
  }
}
