import 'package:flutter/material.dart';
import 'lesson_model.dart';

class LearningModule {
  const LearningModule({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.lessons,
  });

  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<Lesson> lessons;

  int get minutes => lessons.fold(0, (total, lesson) => total + lesson.minutes);
}
