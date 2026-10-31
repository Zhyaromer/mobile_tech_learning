import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/learning_provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/common_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _confirmReset(
    BuildContext context, {
    required bool lessons,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          lessons ? 'Reset learning progress?' : 'Reset quiz scores?',
        ),
        content: Text(
          lessons
              ? 'All completed lessons will be marked as incomplete. Your quiz scores will stay.'
              : 'All quiz scores will be cleared. Your completed lessons will stay.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    if (lessons) {
      context.read<LearningProvider>().reset();
    } else {
      context.read<QuizProvider>().resetScores();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          lessons ? 'Learning progress reset.' : 'Quiz scores reset.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return PageBody(
      children: [
        const PageHeading(
          eyebrow: 'Make yourself at home',
          title: 'Your learning space.',
          description: 'A few simple preferences for the way you learn.',
        ),
        const SectionHeading(title: 'Appearance'),
        Card(
          child: SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Dark mode'),
            subtitle: const Text('A softer screen for evening learning'),
            value: theme.isDark,
            onChanged: theme.setDarkMode,
          ),
        ),
        const SectionHeading(title: 'About'),
        Card(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                leading: const Icon(Icons.info_outline_rounded),
                title: const Text('About app'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: Icon(
                      Icons.phone_android_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 42,
                    ),
                    title: const Text('Mobile Tech Learning'),
                    content: const SingleChildScrollView(
                      child: Text(
                        'A beginner-friendly guide to the technology in your pocket.\n\nExplore 8 modules, 24 lessons, 40 quiz questions, and 10 phone components. All learning content works offline.\n\nNo accounts or personal data collection. Progress and preferences stay in memory for the current session.\n\nVersion 1.0.0',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, indent: 20, endIndent: 20),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                leading: Icon(Icons.new_releases_outlined),
                title: Text('App version'),
                trailing: Text('1.0.0'),
              ),
            ],
          ),
        ),
        const SectionHeading(title: 'A fresh start'),
        Card(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                leading: const Icon(Icons.restart_alt_rounded),
                title: const Text('Reset learning progress'),
                subtitle: const Text('Start your lessons from the beginning'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => _confirmReset(context, lessons: true),
              ),
              const Divider(height: 1, indent: 20, endIndent: 20),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                leading: const Icon(Icons.refresh_rounded),
                title: const Text('Reset quiz scores'),
                subtitle: const Text('Clear all completed quiz results'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => _confirmReset(context, lessons: false),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const InfoCard(
          title: 'Made for learning, wherever you are',
          text:
              'No internet connection is needed. This app keeps your progress for the current session; a full restart gives you a fresh start.',
          icon: Icons.wifi_off_rounded,
        ),
      ],
    );
  }
}
