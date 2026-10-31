import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/module_model.dart';
import '../providers/quiz_provider.dart';
import '../widgets/common_widgets.dart';
import 'quiz_results_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.module});
  final LearningModule module;
  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final question = quiz.currentQuestion;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Knowledge check')),
      body: SafeArea(
        child: PageBody(
          key: ValueKey(quiz.currentIndex),
          children: [
            Text(
              module.title,
              style: TextStyle(
                color: scheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Question ${quiz.currentIndex + 1} of ${quiz.questions.length}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const Icon(Icons.self_improvement_rounded, size: 18),
                const SizedBox(width: 5),
                const Text('No rush', style: TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: (quiz.currentIndex + 1) / quiz.questions.length,
              semanticsLabel: 'Quiz progress',
            ),
            const SizedBox(height: 30),
            Text(
              question.prompt,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Choose one answer.',
              style: TextStyle(color: scheme.onSurfaceVariant),
            ),
            const SizedBox(height: 22),
            for (var i = 0; i < question.answers.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Semantics(
                  selected: quiz.selectedAnswer == i,
                  button: true,
                  child: Card(
                    color: quiz.selectedAnswer == i
                        ? scheme.primaryContainer
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(
                        color: quiz.selectedAnswer == i
                            ? scheme.primary
                            : scheme.outlineVariant,
                        width: quiz.selectedAnswer == i ? 2 : 1,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      key: ValueKey('answer-$i'),
                      onTap: () => quiz.selectAnswer(i),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: quiz.selectedAnswer == i
                                  ? scheme.primary
                                  : scheme.surfaceContainerHighest,
                              foregroundColor: quiz.selectedAnswer == i
                                  ? scheme.onPrimary
                                  : scheme.onSurfaceVariant,
                              child: Text(
                                String.fromCharCode(65 + i),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                question.answers[i],
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.4,
                                  color: quiz.selectedAnswer == i
                                      ? scheme.onPrimaryContainer
                                      : scheme.onSurface,
                                ),
                              ),
                            ),
                            if (quiz.selectedAnswer == i)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: scheme.primary,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: quiz.selectedAnswer == null
                  ? null
                  : () {
                      quiz.nextQuestion();
                      if (quiz.isComplete) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => QuizResultsScreen(module: module),
                          ),
                        );
                      }
                    },
              label: Text(
                quiz.isLastQuestion ? 'Finish quiz' : 'Next question',
              ),
              icon: const Icon(Icons.arrow_forward_rounded, size: 20),
              iconAlignment: IconAlignment.end,
            ),
            const SizedBox(height: 14),
            Text(
              'You can review all answers after the quiz.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
