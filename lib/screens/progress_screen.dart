import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/modules_data.dart';
import '../providers/learning_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/common_widgets.dart';
import 'module_lessons_screen.dart';
import 'quiz_selection_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final learning = context.watch<LearningProvider>();
    final quiz = context.watch<QuizProvider>();
    return PageBody(
      children: [
        const PageHeading(
          eyebrow: 'Your learning journey',
          title: 'Every little step counts.',
          description: 'See what you’ve learned and where you can go next.',
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall completion',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  '${learning.percentage}%',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 48,
                  ),
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: learning.progress,
                  semanticsLabel: 'Learning completion',
                ),
                const SizedBox(height: 12),
                Text(
                  '${learning.completedLessons} of ${learning.totalLessons} lessons completed',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StatCard(
                value: '${modules.length}',
                label: 'Total modules',
                icon: Icons.menu_book_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                value: '${learning.completedModules}',
                label: 'Completed modules',
                icon: Icons.verified_outlined,
              ),
            ),
          ],
        ),
        const SectionHeading(title: 'Module progress'),
        for (final module in modules)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => ModuleLessonsScreen(module: module),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(module.icon, color: module.color, size: 22),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              module.title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          if (learning.isModuleComplete(module))
                            Icon(
                              Icons.check_circle_rounded,
                              color: module.color,
                              size: 20,
                            ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      LinearProgressIndicator(
                        value: learning.moduleProgress(module),
                        color: module.color,
                        minHeight: 5,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        learning.isModuleComplete(module)
                            ? 'Completed · ${module.lessons.length} lessons'
                            : '${learning.completedIn(module)} / ${module.lessons.length} lessons',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        SectionHeading(
          title: 'Quiz scores',
          action: 'Take a quiz',
          onAction: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => const QuizSelectionScreen(),
            ),
          ),
        ),
        if (quiz.latestResults.isEmpty)
          const InfoCard(
            title: 'Your first score is waiting',
            text:
                'Take a module quiz and your result will appear here. Each new attempt replaces that module’s previous score.',
            icon: Icons.quiz_outlined,
          )
        else ...[
          const Text('Latest completed attempt for each module.'),
          const SizedBox(height: 12),
          for (final module in modules.where(
            (module) => quiz.latestResults.containsKey(module.id),
          ))
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                child: ListTile(
                  title: Text(
                    module.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    '${quiz.latestResults[module.id]!.correct} / ${quiz.latestResults[module.id]!.total} correct',
                  ),
                  trailing: Text(
                    '${quiz.latestResults[module.id]!.percentage}%',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
        ],
        const SizedBox(height: 24),
        Text(
          'Progress is kept for this app session and resets when the app restarts.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
