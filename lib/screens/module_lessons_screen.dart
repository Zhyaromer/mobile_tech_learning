import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/module_model.dart';
import '../providers/learning_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/common_widgets.dart';
import 'lesson_screen.dart';
import 'quiz_screen.dart';

class ModuleLessonsScreen extends StatelessWidget {
  const ModuleLessonsScreen({super.key, required this.module});
  final LearningModule module;
  @override
  Widget build(BuildContext context) {
    final learning = context.watch<LearningProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Your learning path')),
      body: SafeArea(
        child: PageBody(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconTile(icon: module.icon, color: module.color, size: 64),
            ),
            const SizedBox(height: 20),
            PageHeading(
              eyebrow:
                  '${module.lessons.length} lessons · ${module.minutes} minutes',
              title: module.title,
              description: module.description,
            ),
            LinearProgressIndicator(
              value: learning.moduleProgress(module),
              color: module.color,
            ),
            const SizedBox(height: 8),
            Text(
              '${learning.completedIn(module)} of ${module.lessons.length} lessons completed',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            for (var i = 0; i < module.lessons.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: module.color.withValues(alpha: .12),
                      foregroundColor: module.color,
                      child: learning.isComplete(module.lessons[i].id)
                          ? const Icon(Icons.check_rounded)
                          : Text('${i + 1}'),
                    ),
                    title: Text(
                      module.lessons[i].title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      '${module.lessons[i].minutes} min read${learning.isComplete(module.lessons[i].id) ? ' · Completed' : ''}',
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      learning.visitLesson(module.lessons[i].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) =>
                              LessonScreen(module: module, initialIndex: i),
                        ),
                      );
                    },
                  ),
                ),
              ),
            const SizedBox(height: 16),
            const InfoCard(
              title: 'Ready to connect the dots?',
              text:
                  'Try five questions about this module. You can take the quiz at any time and retry as often as you like.',
              icon: Icons.lightbulb_outline_rounded,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                context.read<QuizProvider>().startQuiz(module.id);
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => QuizScreen(module: module),
                  ),
                );
              },
              icon: const Icon(Icons.quiz_outlined),
              label: const Text('Take module quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
