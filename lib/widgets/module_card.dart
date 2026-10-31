import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/module_model.dart';
import '../providers/learning_provider.dart';
import '../screens/module_lessons_screen.dart';
import 'common_widgets.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({super.key, required this.module, required this.number});
  final LearningModule module;
  final int number;

  @override
  Widget build(BuildContext context) {
    final learning = context.watch<LearningProvider>();
    final complete = learning.isModuleComplete(module);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => ModuleLessonsScreen(module: module),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconTile(icon: module.icon, color: module.color),
                  const Spacer(),
                  Text(
                    'MODULE ${number.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.2,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (complete)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.check_circle,
                        color: module.color,
                        size: 18,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                module.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 6),
              Text(
                module.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.45,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Icon(Icons.menu_book_outlined, size: 15, color: module.color),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      '${module.lessons.length} lessons · ${module.minutes} min',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: module.color,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: learning.moduleProgress(module),
                color: module.color,
                minHeight: 4,
                semanticsLabel: '${module.title} completion',
              ),
              const SizedBox(height: 8),
              Text(
                complete
                    ? 'Completed'
                    : '${learning.completedIn(module)} of ${module.lessons.length} completed',
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
