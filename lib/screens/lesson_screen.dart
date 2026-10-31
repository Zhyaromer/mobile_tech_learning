import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/module_model.dart';
import '../providers/learning_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/common_widgets.dart';
import 'quiz_screen.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.module, this.initialIndex = 0});
  final LearningModule module;
  final int initialIndex;
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late int _index = widget.initialIndex;

  void _moveTo(int index) {
    context.read<LearningProvider>().visitLesson(
      widget.module.lessons[index].id,
    );
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    final module = widget.module;
    final lesson = module.lessons[_index];
    final learning = context.watch<LearningProvider>();
    final completed = learning.isComplete(lesson.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson ${_index + 1} of ${module.lessons.length}'),
      ),
      body: SafeArea(
        child: PageBody(
          key: ValueKey(lesson.id),
          children: [
            Row(
              children: [
                IconTile(icon: module.icon, color: module.color, size: 56),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    module.title,
                    style: TextStyle(
                      color: module.color,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            PageHeading(
              eyebrow:
                  '${lesson.minutes} min read${completed ? ' · Completed' : ''}',
              title: lesson.title,
              description: 'One idea at a time. Take it at your own pace.',
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < lesson.content.length; i++) ...[
                      Text(
                        lesson.content[i],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (i < lesson.content.length - 1)
                        const SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            InfoCard(
              title: 'Worth remembering',
              text: lesson.fact,
              icon: Icons.lightbulb_outline_rounded,
            ),
            const SizedBox(height: 14),
            InfoCard(
              title: 'In everyday life',
              text: lesson.example,
              icon: Icons.public_rounded,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: completed
                  ? null
                  : () {
                      learning.completeLesson(lesson.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Lesson completed. One step further!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
              icon: Icon(
                completed ? Icons.check_circle_rounded : Icons.check_rounded,
              ),
              label: Text(completed ? 'Completed' : 'Mark as completed'),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _index > 0 ? () => _moveTo(_index - 1) : null,
                    child: const Text('Previous'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _index < module.lessons.length - 1
                        ? () => _moveTo(_index + 1)
                        : null,
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
            if (_index == module.lessons.length - 1) ...[
              const SizedBox(height: 20),
              TextButton.icon(
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
                label: const Text('Try the module quiz'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
