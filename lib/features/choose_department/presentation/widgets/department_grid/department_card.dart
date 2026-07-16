import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wat_schedule/core/extensions/context_extension.dart';

class DepartmentCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const DepartmentCard({
    required this.name,
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final scheduleColors = context.scheduleColors;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: scheduleColors.surfaceMuted,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const Skeletonizer.zone(
                          child: Bone(
                            width: double.infinity,
                            height: double.infinity,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.school_outlined,
                        color: scheduleColors.mutedText,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
