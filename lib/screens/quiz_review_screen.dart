import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/module_model.dart';
import '../providers/quiz_provider.dart';
import '../widgets/common_widgets.dart';

class QuizReviewScreen extends StatelessWidget {
  const QuizReviewScreen({super.key, required this.module});
  final LearningModule module;
  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Review answers')),
      body: SafeArea(
        child: PageBody(
          children: [
            PageHeading(
              eyebrow: 'Learn from every answer',
              title: 'Let’s connect the dots.',
              description: module.title,
            ),
            for (var i = 0; i < quiz.questions.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              quiz.answers[i] == quiz.questions[i].correctIndex
                                  ? Icons.check_circle_rounded
                                  : Icons.cancel_outlined,
                              color:
                                  quiz.answers[i] ==
                                      quiz.questions[i].correctIndex
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Question ${i + 1} · ${quiz.answers[i] == quiz.questions[i].correctIndex ? 'Correct' : 'Incorrect'}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          quiz.questions[i].prompt,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your answer: ${quiz.questions[i].answers[quiz.answers[i]]}',
                        ),
                        if (quiz.answers[i] !=
                            quiz.questions[i].correctIndex) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Correct answer: ${quiz.questions[i].answers[quiz.questions[i].correctIndex]}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                        const SizedBox(height: 18),
                        InfoCard(
                          title: 'Why?',
                          text: quiz.questions[i].explanation,
                          icon: Icons.lightbulb_outline_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to results'),
            ),
          ],
        ),
      ),
    );
  }
}
