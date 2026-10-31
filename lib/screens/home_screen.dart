import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/modules_data.dart';
import '../providers/learning_provider.dart';
import '../widgets/common_widgets.dart';
import '../widgets/module_card.dart';
import '../widgets/progress_card.dart';
import 'lesson_screen.dart';
import 'quiz_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onSelectTab});
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) {
    final learning = context.watch<LearningProvider>();
    final lessonId = learning.continueLessonId;
    final module = modules.firstWhere(
      (module) => module.lessons.any((lesson) => lesson.id == lessonId),
      orElse: () => modules.first,
    );
    final index = module.lessons.indexWhere((lesson) => lesson.id == lessonId);
    return PageBody(
      children: [
        const PageHeading(
          eyebrow: 'Your pocket-sized classroom',
          title: 'Welcome, curious mind.',
          description: 'Let’s discover what makes your phone tick.',
        ),
        const ProgressCard(),
        const SectionHeading(title: 'Continue learning'),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconTile(
                      icon: lessonId == null
                          ? Icons.verified_rounded
                          : module.icon,
                      color: module.color,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lessonId == null
                                ? 'All lessons completed!'
                                : module.lessons[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            lessonId == null
                                ? 'Keep your knowledge fresh with a quiz.'
                                : 'Lesson ${index + 1} of ${module.lessons.length} · ${module.lessons[index].minutes} min read',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      if (lessonId == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => const QuizSelectionScreen(),
                          ),
                        );
                      } else {
                        learning.visitLesson(lessonId);
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => LessonScreen(
                              module: module,
                              initialIndex: index,
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                    iconAlignment: IconAlignment.end,
                    label: Text(
                      lessonId == null
                          ? 'Test your knowledge'
                          : learning.completedLessons == 0
                          ? 'Start learning'
                          : 'Continue lesson',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SectionHeading(title: 'Make a discovery'),
        LayoutBuilder(
          builder: (context, constraints) {
            final shortcuts = [
              _Shortcut(
                title: 'Phone explorer',
                subtitle: 'See what’s inside',
                icon: Icons.explore_outlined,
                color: const Color(0xFF138778),
                onTap: () => onSelectTab(2),
              ),
              _Shortcut(
                title: 'Take a quiz',
                subtitle: 'Put ideas to the test',
                icon: Icons.quiz_outlined,
                color: const Color(0xFF9361D9),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const QuizSelectionScreen(),
                  ),
                ),
              ),
            ];
            if (constraints.maxWidth < 340 ||
                MediaQuery.textScalerOf(context).scale(1) > 1.3) {
              return Column(
                children: [
                  shortcuts[0],
                  const SizedBox(height: 12),
                  shortcuts[1],
                ],
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: shortcuts[0]),
                const SizedBox(width: 12),
                Expanded(child: shortcuts[1]),
              ],
            );
          },
        ),
        SectionHeading(
          title: 'Learning modules',
          action: 'View all',
          onAction: () => onSelectTab(1),
        ),
        for (var i = 0; i < 2; i++) ...[
          ModuleCard(module: modules[i], number: i + 1),
          const SizedBox(height: 12),
        ],
        const SizedBox(height: 10),
        Text(
          '8 modules. 24 lessons. A whole new perspective.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _Shortcut extends StatelessWidget {
  const _Shortcut({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconTile(icon: icon, color: color, size: 42),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    ),
  );
}
