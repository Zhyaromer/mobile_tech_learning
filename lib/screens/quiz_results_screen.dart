import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/module_model.dart';
import '../providers/quiz_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import 'main_screen.dart';
import 'quiz_screen.dart';
import 'quiz_review_screen.dart';

class QuizResultsScreen extends StatelessWidget {
  const QuizResultsScreen({super.key, required this.module});
  final LearningModule module;
  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final result = quiz.result;
    final title = result.percentage >= 80
        ? 'You’re making connections!'
        : result.percentage >= 60
        ? 'You’re getting there!'
        : 'Every try is a step forward.';
    final feedback = result.percentage >= 80
        ? 'Great work. Keep exploring and build on what you know.'
        : result.percentage >= 60
        ? 'A good foundation. Review the answers to fill in the gaps.'
        : 'Take another look at the lessons, then give it another go.';
    return Scaffold(
      appBar: AppBar(title: const Text('Your quiz results')),
      body: SafeArea(
        child: PageBody(
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: AppTheme.navy,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.workspace_premium_outlined,
                    color: AppTheme.amber,
                    size: 46,
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'KNOWLEDGE CHECK COMPLETE',
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.2,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 144,
                    height: 144,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox.expand(
                          child: CircularProgressIndicator(
                            value: result.percentage / 100,
                            strokeWidth: 8,
                            color: AppTheme.amber,
                            backgroundColor: Colors.white12,
                            semanticsLabel: 'Quiz score',
                          ),
                        ),
                        Text(
                          '${result.percentage}%',
                          style: const TextStyle(
                            fontSize: 42,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    module.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 10),
            Text(feedback, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StatCard(
                    value: '${result.total}',
                    label: 'Questions',
                    icon: Icons.quiz_outlined,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: StatCard(
                    value: '${result.correct}',
                    label: 'Correct',
                    icon: Icons.check_circle_outline,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: StatCard(
                    value: '${result.wrong}',
                    label: 'Wrong',
                    icon: Icons.cancel_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => QuizReviewScreen(module: module),
                ),
              ),
              icon: const Icon(Icons.fact_check_outlined),
              label: const Text('Review answers'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                quiz.startQuiz(module.id);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => QuizScreen(module: module),
                  ),
                );
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry quiz'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(builder: (_) => const MainScreen()),
                (_) => false,
              ),
              child: const Text('Back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
