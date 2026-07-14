import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FacultyGroupListSkeleton extends StatelessWidget {
  const FacultyGroupListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, __) => const _FacultyGroupTileSkeleton(),
      ),
    );
  }
}

class _FacultyGroupTileSkeleton extends StatelessWidget {
  const _FacultyGroupTileSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Bone.text(width: 120),
            ),
            SizedBox(width: 16),
            Bone.icon(size: 20),
          ],
        ),
      ),
    );
  }
}
