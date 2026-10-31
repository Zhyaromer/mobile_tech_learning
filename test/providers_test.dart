import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_tech_learning/data/components_data.dart';
import 'package:mobile_tech_learning/data/modules_data.dart';
import 'package:mobile_tech_learning/data/questions_data.dart';
import 'package:mobile_tech_learning/providers/learning_provider.dart';
import 'package:mobile_tech_learning/providers/quiz_provider.dart';

void main() {
  test('curriculum has unique lessons and valid four-answer quizzes', () {
    expect(modules.length, 8);
    expect(phoneComponents.length, 10);
    final lessonIds = <String>{};
    for (final module in modules) {
      expect(module.lessons.length, 3);
      for (final lesson in module.lessons) {
        expect(lessonIds.add(lesson.id), isTrue);
        expect(lesson.content.length, greaterThanOrEqualTo(2));
        expect(lesson.fact, isNotEmpty);
        expect(lesson.example, isNotEmpty);
      }
      final questions = questionsByModule[module.id]!;
      expect(questions.length, 5);
      for (final question in questions) {
        expect(question.answers.length, 4);
        expect(question.answers.toSet().length, 4);
        expect(question.correctIndex, inInclusiveRange(0, 3));
        expect(question.explanation, isNotEmpty);
      }
    }
    expect(lessonIds.length, 24);
  });

  test(
    'completion is idempotent and continuation follows reading progress',
    () {
      final learning = LearningProvider();
      expect(learning.continueLessonId, 'intro-1');
      learning.visitLesson('hardware-2');
      expect(learning.continueLessonId, 'hardware-2');
      learning.completeLesson('hardware-2');
      learning.completeLesson('hardware-2');
      learning.completeLesson('not-a-lesson');
      expect(learning.completedLessons, 1);
      expect(learning.continueLessonId, 'intro-1');
      for (final module in modules) {
        for (final lesson in module.lessons) {
          learning.completeLesson(lesson.id);
        }
      }
      expect(learning.completedModules, 8);
      expect(learning.percentage, 100);
      expect(learning.continueLessonId, isNull);
      learning.reset();
      expect(learning.completedLessons, 0);
      expect(learning.completedModules, 0);
      expect(learning.continueLessonId, 'intro-1');
    },
  );

  test(
    'each quiz scores all-correct, mixed, and all-wrong attempts accurately',
    () {
      final quiz = QuizProvider();
      for (final module in modules) {
        for (final targetCorrect in [5, 3, 0]) {
          quiz.startQuiz(module.id);
          quiz.nextQuestion(); // Unanswered questions cannot be skipped.
          expect(quiz.currentIndex, 0);
          quiz.selectAnswer(4);
          expect(quiz.selectedAnswer, isNull);
          for (var i = 0; i < 5; i++) {
            final correct = quiz.currentQuestion.correctIndex;
            quiz.selectAnswer(i < targetCorrect ? correct : (correct + 1) % 4);
            quiz.nextQuestion();
          }
          expect(quiz.isComplete, isTrue);
          expect(quiz.result.correct, targetCorrect);
          expect(quiz.result.wrong, 5 - targetCorrect);
          expect(quiz.result.percentage, targetCorrect * 20);
          quiz.nextQuestion();
          quiz.selectAnswer(0);
          expect(quiz.answers.length, 5);
          expect(quiz.latestResults[module.id]!.correct, targetCorrect);
        }
      }
      expect(quiz.latestResults.length, 8);
    },
  );

  test('retry clears the attempt and reset affects only quiz data', () {
    final quiz = QuizProvider();
    final learning = LearningProvider()..completeLesson('intro-1');
    quiz.startQuiz('intro');
    for (var i = 0; i < 5; i++) {
      quiz.selectAnswer(quiz.currentQuestion.correctIndex);
      quiz.nextQuestion();
    }
    quiz.startQuiz('intro');
    expect(quiz.currentIndex, 0);
    expect(quiz.selectedAnswer, isNull);
    expect(quiz.answers, isEmpty);
    expect(quiz.isComplete, isFalse);
    expect(quiz.latestResults['intro']!.percentage, 100);
    quiz.resetScores();
    expect(quiz.latestResults, isEmpty);
    expect(learning.completedLessons, 1);
  });
}
