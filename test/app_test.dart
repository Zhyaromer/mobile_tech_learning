import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mobile_tech_learning/main.dart';
import 'package:mobile_tech_learning/data/modules_data.dart';
import 'package:mobile_tech_learning/data/questions_data.dart';
import 'package:mobile_tech_learning/providers/learning_provider.dart';
import 'package:mobile_tech_learning/providers/quiz_provider.dart';
import 'package:mobile_tech_learning/providers/theme_provider.dart';
import 'package:mobile_tech_learning/screens/main_screen.dart';
import 'package:mobile_tech_learning/screens/onboarding_screen.dart';
import 'package:mobile_tech_learning/screens/quiz_screen.dart';
import 'package:mobile_tech_learning/theme/app_theme.dart';

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pumpAndSettle();
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

Future<void> launch(
  WidgetTester tester, {
  Size size = const Size(390, 844),
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(const MobileTechApp());
  await tester.pump(const Duration(seconds: 2));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets(
    'splash, all onboarding pages, lesson completion and navigation',
    (tester) async {
      await launch(tester);
      expect(find.byType(OnboardingScreen), findsOneWidget);
      await tapVisible(tester, find.text('Next'));
      expect(find.text('Go beneath\nthe screen.'), findsOneWidget);
      await tapVisible(tester, find.text('Next'));
      await tapVisible(tester, find.text('Get Started'));
      expect(find.text('Welcome, curious mind.'), findsOneWidget);
      await tapVisible(tester, find.text('Start learning'));
      expect(find.text('A small computer in your pocket'), findsOneWidget);
      await tapVisible(tester, find.text('Mark as completed'));
      expect(find.text('Completed'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      await tapVisible(tester, find.text('Next'));
      expect(find.text('How phones communicate'), findsOneWidget);
      await tapVisible(tester, find.text('Previous'));
      expect(find.text('A small computer in your pocket'), findsOneWidget);
      await tester.pageBack();
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(MainScreen));
      expect(context.read<LearningProvider>().completedLessons, 1);
      await tapVisible(tester, find.text('Learn'));
      await tapVisible(tester, find.text('Mobile Hardware Components'));
      await tapVisible(tester, find.text('CPU, RAM, and storage'));
      expect(find.text('Worth remembering'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('quiz selection, mixed score, review, retry, and back home', (
    tester,
  ) async {
    await launch(tester);
    await tapVisible(tester, find.text('Skip'));
    await tapVisible(tester, find.text('Take a quiz'));
    await tapVisible(tester, find.text('Introduction to Mobile Technology'));
    final questions = questionsByModule['intro']!;
    for (var i = 0; i < questions.length; i++) {
      final next = find.widgetWithText(
        FilledButton,
        i == 4 ? 'Finish quiz' : 'Next question',
      );
      expect(tester.widget<FilledButton>(next).onPressed, isNull);
      final answer = i < 3
          ? questions[i].correctIndex
          : (questions[i].correctIndex + 1) % 4;
      await tapVisible(tester, find.byKey(ValueKey('answer-$answer')));
      await tapVisible(tester, next);
    }
    expect(find.text('60%'), findsOneWidget);
    await tapVisible(tester, find.text('Review answers'));
    expect(find.text('Question 1 · Correct'), findsOneWidget);
    await tapVisible(tester, find.text('Back to results'));
    await tapVisible(tester, find.text('Retry quiz'));
    expect(find.text('Question 1 of 5'), findsOneWidget);
    for (var i = 0; i < 5; i++) {
      await tapVisible(
        tester,
        find.byKey(ValueKey('answer-${questions[i].correctIndex}')),
      );
      await tapVisible(
        tester,
        find.text(i == 4 ? 'Finish quiz' : 'Next question'),
      );
    }
    expect(find.text('100%'), findsOneWidget);
    await tapVisible(tester, find.text('Back to home'));
    expect(find.text('Welcome, curious mind.'), findsOneWidget);
    expect(
      tester
          .element(find.byType(MainScreen))
          .read<QuizProvider>()
          .latestResults['intro']!
          .percentage,
      100,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'all ten phone parts update details; theme and independent resets work',
    (tester) async {
      await launch(tester);
      await tapVisible(tester, find.text('Skip'));
      await tapVisible(tester, find.text('Explore'));
      const names = [
        'Screen',
        'Battery',
        'Processor (CPU)',
        'RAM',
        'Storage',
        'Camera',
        'Speaker',
        'Microphone',
        'Sensors',
        'SIM Card',
      ];
      for (var i = 0; i < 10; i++) {
        await tapVisible(tester, find.byKey(ValueKey('phone-part-$i')));
        expect(
          tester
              .widget<Text>(find.byKey(const ValueKey('component-title')))
              .data,
          names[i],
        );
      }
      final context = tester.element(find.byType(MainScreen));
      context.read<LearningProvider>().completeLesson('intro-1');
      final quiz = context.read<QuizProvider>()..startQuiz('intro');
      for (var i = 0; i < 5; i++) {
        quiz.selectAnswer(quiz.currentQuestion.correctIndex);
        quiz.nextQuestion();
      }
      await tapVisible(tester, find.text('Settings'));
      await tapVisible(tester, find.byType(SwitchListTile));
      expect(context.read<ThemeProvider>().isDark, isTrue);
      expect(
        Theme.of(tester.element(find.text('Dark mode'))).brightness,
        Brightness.dark,
      );
      await tapVisible(tester, find.text('About app'));
      expect(
        find.textContaining('24 lessons, 40 quiz questions'),
        findsOneWidget,
      );
      await tapVisible(tester, find.text('Close'));
      await tapVisible(tester, find.text('Reset learning progress'));
      await tapVisible(tester, find.text('Cancel'));
      expect(context.read<LearningProvider>().completedLessons, 1);
      await tapVisible(tester, find.text('Reset learning progress'));
      await tapVisible(tester, find.text('Reset'));
      expect(context.read<LearningProvider>().completedLessons, 0);
      expect(quiz.latestResults, isNotEmpty);
      context.read<LearningProvider>().completeLesson('intro-2');
      await tapVisible(tester, find.text('Reset quiz scores'));
      await tapVisible(tester, find.text('Reset'));
      expect(quiz.latestResults, isEmpty);
      expect(context.read<LearningProvider>().completedLessons, 1);
      await tapVisible(tester, find.text('Progress'));
      expect(find.text('1 of 24 lessons completed'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  for (final size in [
    const Size(320, 640),
    const Size(844, 390),
    const Size(1024, 900),
  ]) {
    testWidgets('all tabs fit ${size.width} x ${size.height}', (tester) async {
      await launch(tester, size: size);
      await tapVisible(tester, find.text('Skip'));
      for (final tab in ['Learn', 'Explore', 'Progress', 'Settings', 'Home']) {
        await tapVisible(tester, find.text(tab));
        expect(tester.takeException(), isNull);
      }
    });
  }

  testWidgets('large text fits narrow quiz and result layouts', (tester) async {
    tester.view.physicalSize = const Size(320, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final quiz = QuizProvider()..startQuiz('security');
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LearningProvider()),
          ChangeNotifierProvider.value(value: quiz),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: MaterialApp(
          theme: AppTheme.dark,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.5)),
            child: child!,
          ),
          home: QuizScreen(module: modules[6]),
        ),
      ),
    );
    await tester.pumpAndSettle();
    for (var i = 0; i < 5; i++) {
      await tapVisible(
        tester,
        find.byKey(ValueKey('answer-${quiz.currentQuestion.correctIndex}')),
      );
      await tapVisible(
        tester,
        find.text(i == 4 ? 'Finish quiz' : 'Next question'),
      );
    }
    expect(find.text('100%'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
