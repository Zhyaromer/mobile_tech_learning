import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/modules_data.dart';
import '../providers/quiz_provider.dart';
import '../widgets/common_widgets.dart';
import 'quiz_screen.dart';

class QuizSelectionScreen extends StatelessWidget {
  const QuizSelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Knowledge check')),
      body: SafeArea(
        child: PageBody(
          children: [
            const PageHeading(
              eyebrow: 'Make it stick',
              title: 'Ready for a challenge?',
              description:
                  'Choose a module. Five questions, no timer, and something to learn from every answer.',
            ),
            for (final module in modules)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    leading: IconTile(icon: module.icon, color: module.color),
                    title: Text(
                      module.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      '5 questions${quiz.latestResults.containsKey(module.id) ? ' · Latest: ${quiz.latestResults[module.id]!.percentage}%' : ' · Not taken yet'}',
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      quiz.startQuiz(module.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => QuizScreen(module: module),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
