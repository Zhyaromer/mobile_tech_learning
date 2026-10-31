# Mobile Tech Learning

A complete Flutter student project for learning how mobile phones work. The app uses Dart, Material 3, and three simple `ChangeNotifier` providers. All educational content is local.

## Run the project

Use Flutter stable with Dart 3.10 or newer. This project was verified with Flutter 3.41.7 and Dart 3.11.5.

```powershell
cd C:\Users\PC\Documents\mobile_tech_learning
flutter pub get
flutter run
```

Select an available device when prompted. To run the same Flutter app in Chrome:

```powershell
flutter run -d chrome --no-web-resources-cdn
```

To serve a release preview locally:

```powershell
flutter run -d web-server --release --no-web-resources-cdn --web-hostname 127.0.0.1 --web-port 54321
```

Open `http://127.0.0.1:54321` while that command is running. The local server only serves the compiled Flutter app; the application has no backend. The flag bundles Flutter's rendering resources locally. Roboto and Material icons are also bundled, so the app does not need a font or rendering CDN.

Dependency installation and initial SDK setup need internet access. Lessons, quizzes, and app features do not use APIs or online services. Progress and theme preferences intentionally reset on a full restart; hot reload normally preserves the running session.

### Platform requirements

- **Android:** Install Android Studio and its SDK, finish the setup reported by `flutter doctor`, and connect an Android device or emulator. Then use `flutter run` or `flutter build apk --release`.
- **iOS:** Open this project on macOS with Xcode installed, select a development signing team, and run on a simulator or connected iPhone.
- **Windows:** Install Visual Studio's Desktop development with C++ workload, including its SDK and CMake components, then use `flutter run -d windows`.
- **Web:** Chrome or Edge is sufficient for a development preview.

The build machine has Chrome, but no Android SDK and an incomplete Windows C++ toolchain. The web release was compiled and launched successfully. Native Android, iOS, and Windows builds have not been verified on this machine.

## What is included

| Screen | Working features |
| --- | --- |
| Splash | Phone icon, app name, loading indicator, automatic two-second transition |
| Onboarding | Three swipeable pages, Next, Skip, Get Started |
| Home | Welcome, completion percentage, continue lesson, module cards, explorer and quiz shortcuts |
| Learning modules | All eight modules, descriptions, icons, lesson counts, completion bars |
| Lessons | Three lessons per module, facts, examples, previous/next, explicit completion |
| Phone explorer | Ten tappable diagram parts, component descriptions, importance, and examples |
| Quiz | Five questions per module, four options each, one question at a time, answer selection and progress |
| Results | Correct/wrong counts, percentage, score-based feedback, retry, answer review, back home |
| Progress | Overall completion, completed modules/lessons, per-module progress, latest quiz results |
| Settings | Light/dark mode, about dialog, version, separate confirmed resets |

The five main tabs are Home, Learn, Explore, Progress, and Settings. Supporting screens provide a module's lesson list, quiz selection, and answer review.

There are **24 lessons, 40 questions, and 10 phone components**. Topics cover mobile basics, history, hardware, operating systems, 2G–5G networks, apps, security, and future technology. The phone drawing is an educational schematic, not a physical layout or a 3D model.

## Simple project structure

```text
lib/
  main.dart                     App entry point and MultiProvider
  models/                       Lesson, module, question, result, component
  data/                         Local Dart lists containing the curriculum
  providers/
    learning_provider.dart      Completed lesson IDs and continuation
    quiz_provider.dart          Current attempt and latest module scores
    theme_provider.dart         Light/dark preference
  screens/                      Screens using Navigator and basic widgets
  theme/app_theme.dart          Material 3 colors and shared styles
  widgets/                      Reusable cards and the interactive phone diagram
assets/fonts/                   Bundled Roboto fonts and license
test/                           Provider, data, navigation, and layout tests
tool/capture_screens_test.dart   Optional screenshot and launcher-icon generator
qa/screenshots/                 Rendered mobile and tablet previews
```

### How state works

`LearningProvider` stores completed lesson IDs in a `Set`, so completing the same lesson twice cannot increase the total. Reading a lesson remembers it for Continue Learning; after it is completed, the dashboard offers the next unfinished lesson in the course. Completing every lesson in a module marks that module complete.

`QuizProvider` stores the selected option separately from submitted answers. Next is disabled until an option is selected. The final answer creates a result using `correct / total × 100`. Review shows your answers, the correct answers, and explanations. A retry clears only the current attempt. The progress screen shows the most recent completed attempt for each module; a later attempt replaces the previous score.

`ThemeProvider` holds one boolean and notifies the app when it changes. `Consumer` and `context.watch()` rebuild widgets that need updated state. Buttons use `context.read()` when they only need to call a provider method.

All state stays in memory. Reset Learning Progress leaves quiz scores untouched. Reset Quiz Scores leaves completed lessons untouched. There are no accounts, databases, persistent storage packages, analytics, Firebase services, or app network requests.

### Editing the curriculum

Edit `lib/data/lessons_data.dart` to change lesson text. Each lesson has a unique ID, title, paragraphs, fact, example, and reading time. `modules_data.dart` groups lessons into modules and supplies their icons and colors.

Edit `questions_data.dart` to change quiz questions. Every question has four distinct answers, a zero-based `correctIndex`, and an explanation. The map keys match module IDs. `components_data.dart` holds the ten phone component explanations.

## Verification

```powershell
flutter analyze
flutter test
flutter test tool/capture_screens_test.dart
flutter build web --release --no-web-resources-cdn
```

The normal suite has 11 tests covering curriculum integrity, duplicate completion, all-correct/mixed/all-wrong scoring for every module, retry/reset behavior, splash and onboarding, lesson navigation, quiz review, all ten components, theme switching, and independent resets. Layout checks cover 320-pixel phones, landscape, tablets, and larger quiz text.

The optional visual test renders nine representative screenshots and regenerates the phone launcher icons for Android, iOS, web, and Windows. It uses Flutter's own drawing APIs, requires no extra packages, and is not part of the normal test suite.

`provider` is the only additional runtime dependency. `flutter_test` comes from the SDK; `flutter_lints` is only a development lint package. The lockfile records the tested package versions.

## Learning references

The beginner explanations are written for this app. Primary references for historical milestones and implementation choices include:

- [Motorola's history timeline](https://www.motorolasolutions.com/en_us/about/history/timeline.html): the 1973 handheld demonstration and 1983 commercial handheld phone.
- [Vodafone: the first text message](https://www.vodafone.com/news/newsroom/technology/25-anniversary-text-message): SMS history and the 1992 first message.
- [Apple's 2007 iPhone announcement](https://www.apple.com/newsroom/2007/01/09Apple-Reinvents-the-Phone-with-iPhone/): launch, touch interface, and sensors.
- [Google: the first Android phone](https://opensource.googleblog.com/2008/10/android-open-source-cell-phone.html): the 2008 T-Mobile G1.
- [Provider documentation](https://pub.dev/packages/provider): simple `ChangeNotifier`, `Consumer`, and `MultiProvider` usage.
- [Flutter Material documentation](https://docs.flutter.dev/ui/design/material): Flutter's Material components.

These references are documentation links, not services used by the app. The bundled Roboto font license is in `assets/fonts/LICENSE.txt`.
