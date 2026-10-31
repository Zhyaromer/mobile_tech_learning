import 'package:flutter/foundation.dart';
import '../data/modules_data.dart';
import '../models/module_model.dart';

class LearningProvider extends ChangeNotifier {
  final Set<String> _completedIds = {};
  String? _lastLessonId;

  int get totalLessons =>
      modules.fold(0, (sum, module) => sum + module.lessons.length);
  int get completedLessons => _completedIds.length;
  double get progress => completedLessons / totalLessons;
  int get percentage => (progress * 100).round();
  int get completedModules => modules.where(isModuleComplete).length;
  bool isComplete(String lessonId) => _completedIds.contains(lessonId);
  int completedIn(LearningModule module) =>
      module.lessons.where((lesson) => isComplete(lesson.id)).length;
  double moduleProgress(LearningModule module) =>
      completedIn(module) / module.lessons.length;
  bool isModuleComplete(LearningModule module) =>
      completedIn(module) == module.lessons.length;

  String? get continueLessonId {
    if (_lastLessonId != null && !isComplete(_lastLessonId!)) {
      return _lastLessonId;
    }
    for (final module in modules) {
      for (final lesson in module.lessons) {
        if (!isComplete(lesson.id)) return lesson.id;
      }
    }
    return null;
  }

  void visitLesson(String id) {
    _lastLessonId = id;
    notifyListeners();
  }

  void completeLesson(String id) {
    // A Set prevents a lesson being counted twice.
    if (modules.any(
          (module) => module.lessons.any((lesson) => lesson.id == id),
        ) &&
        _completedIds.add(id)) {
      notifyListeners();
    }
  }

  void reset() {
    _completedIds.clear();
    _lastLessonId = null;
    notifyListeners();
  }
}
