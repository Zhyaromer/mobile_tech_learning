// Optional visual QA and launcher icon generator. Run with:
// flutter test tool/capture_screens_test.dart
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mobile_tech_learning/data/modules_data.dart';
import 'package:mobile_tech_learning/providers/learning_provider.dart';
import 'package:mobile_tech_learning/providers/quiz_provider.dart';
import 'package:mobile_tech_learning/providers/theme_provider.dart';
import 'package:mobile_tech_learning/screens/main_screen.dart';
import 'package:mobile_tech_learning/screens/lesson_screen.dart';
import 'package:mobile_tech_learning/screens/onboarding_screen.dart';
import 'package:mobile_tech_learning/screens/quiz_screen.dart';
import 'package:mobile_tech_learning/screens/quiz_results_screen.dart';
import 'package:mobile_tech_learning/theme/app_theme.dart';

Future<Uint8List> drawIcon(int size) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder)..scale(size / 512);
  canvas.drawColor(AppTheme.navy, BlendMode.src);
  canvas.drawCircle(
    const Offset(256, 256),
    194,
    Paint()..color = const Color(0xFF1D4072),
  );
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(163, 104, 186, 304),
      const Radius.circular(32),
    ),
    Paint()..color = AppTheme.amber,
  );
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(179, 125, 154, 256),
      const Radius.circular(20),
    ),
    Paint()..color = AppTheme.navy,
  );
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(231, 132, 50, 7),
      const Radius.circular(4),
    ),
    Paint()..color = AppTheme.amber,
  );
  final path = Path()
    ..moveTo(218, 262)
    ..lineTo(245, 290)
    ..lineTo(296, 230);
  canvas.drawPath(
    path,
    Paint()
      ..color = AppTheme.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 17
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round,
  );
  canvas.drawCircle(const Offset(256, 394), 5, Paint()..color = AppTheme.navy);
  final picture = recorder.endRecording();
  final image = await picture.toImage(size, size);
  final bytes = (await image.toByteData(
    format: ui.ImageByteFormat.png,
  ))!.buffer.asUint8List();
  image.dispose();
  picture.dispose();
  return bytes;
}

Future<void> generateIcons() async {
  final targets = <String, int>{
    'web/favicon.png': 32,
    'web/icons/Icon-192.png': 192,
    'web/icons/Icon-512.png': 512,
    'web/icons/Icon-maskable-192.png': 192,
    'web/icons/Icon-maskable-512.png': 512,
    for (final entry in {
      'mdpi': 48,
      'hdpi': 72,
      'xhdpi': 96,
      'xxhdpi': 144,
      'xxxhdpi': 192,
    }.entries)
      'android/app/src/main/res/mipmap-${entry.key}/ic_launcher.png':
          entry.value,
  };
  const ios = 'ios/Runner/Assets.xcassets/AppIcon.appiconset';
  final manifest =
      jsonDecode(File('$ios/Contents.json').readAsStringSync())
          as Map<String, dynamic>;
  for (final entry in manifest['images'] as List<dynamic>) {
    final points = double.parse((entry['size'] as String).split('x').first);
    final scale = double.parse((entry['scale'] as String).replaceAll('x', ''));
    targets['$ios/${entry['filename']}'] = (points * scale).round();
  }
  for (final entry in targets.entries) {
    File(entry.key).writeAsBytesSync(await drawIcon(entry.value));
  }
  final png = await drawIcon(256);
  final header = ByteData(22)
    ..setUint16(2, 1, Endian.little)
    ..setUint16(4, 1, Endian.little)
    ..setUint16(10, 1, Endian.little)
    ..setUint16(12, 32, Endian.little)
    ..setUint32(14, png.length, Endian.little)
    ..setUint32(18, 22, Endian.little);
  File(
    'windows/runner/resources/app_icon.ico',
  ).writeAsBytesSync([...header.buffer.asUint8List(), ...png]);
}

void main() {
  testWidgets('capture actual Flutter layouts and generate phone icons', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final fonts = FontLoader('Roboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'))
      ..addFont(rootBundle.load('assets/fonts/Roboto-Bold.ttf'))
      ..addFont(rootBundle.load('assets/fonts/Roboto-Black.ttf'));
    await fonts.load();
    final icons = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
    await icons.load();
    Directory('qa/screenshots').createSync(recursive: true);
    const captureKey = ValueKey('capture');

    Future<void> mount(
      Widget screen, {
      QuizProvider? quiz,
      bool dark = false,
    }) async {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pumpWidget(
        RepaintBoundary(
          key: captureKey,
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => LearningProvider()),
              ChangeNotifierProvider(create: (_) => quiz ?? QuizProvider()),
              ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: dark ? AppTheme.dark : AppTheme.light,
              home: screen,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    Future<void> capture(String name) async {
      expect(tester.takeException(), isNull);
      final boundary = tester.renderObject<RenderRepaintBoundary>(
        find.byKey(captureKey),
      );
      await tester.runAsync(() async {
        final image = await boundary.toImage(pixelRatio: 2);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        File(
          'qa/screenshots/$name.png',
        ).writeAsBytesSync(bytes!.buffer.asUint8List());
        image.dispose();
      });
    }

    await mount(const OnboardingScreen());
    await capture('01-onboarding');
    await mount(const MainScreen());
    await capture('02-home');
    await tester.tap(find.text('Learn'));
    await tester.pumpAndSettle();
    await capture('03-modules');
    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();
    await capture('04-explorer');
    await mount(LessonScreen(module: modules.first));
    await capture('05-lesson');
    await mount(
      QuizScreen(module: modules.first),
      quiz: QuizProvider()..startQuiz('intro'),
    );
    await capture('06-quiz');
    final completedQuiz = QuizProvider()..startQuiz('intro');
    for (var i = 0; i < 5; i++) {
      completedQuiz.selectAnswer(
        i < 4 ? completedQuiz.currentQuestion.correctIndex : 0,
      );
      completedQuiz.nextQuestion();
    }
    await mount(QuizResultsScreen(module: modules.first), quiz: completedQuiz);
    await capture('07-results');
    await mount(const MainScreen(), dark: true);
    await capture('08-dark-home');
    tester.view.physicalSize = const Size(1024, 900);
    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();
    await capture('09-tablet-explorer');
    await tester.runAsync(generateIcons);
  });
}
