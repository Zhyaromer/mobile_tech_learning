import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/learning_provider.dart';
import '../theme/app_theme.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final learning = context.watch<LearningProvider>();
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.navy, Color(0xFF1A4690)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome_rounded, color: AppTheme.amber, size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'A LITTLE LEARNING, EVERY DAY',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 1,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            learning.percentage == 100
                ? 'Look how far\nyou have come.'
                : 'Big ideas.\nSmall device.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w800,
              height: 1.12,
              letterSpacing: -.8,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Understand the technology you use every day.',
            style: TextStyle(color: Color(0xFFC4D5F3), height: 1.5),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${learning.completedLessons} of ${learning.totalLessons} lessons completed',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),
              Text(
                '${learning.percentage}%',
                style: const TextStyle(
                  color: AppTheme.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: learning.progress,
            color: AppTheme.amber,
            backgroundColor: Colors.white.withValues(alpha: .16),
            minHeight: 6,
            semanticsLabel: 'Overall learning progress',
          ),
        ],
      ),
    );
  }
}
