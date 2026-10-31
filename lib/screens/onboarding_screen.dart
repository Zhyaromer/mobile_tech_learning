import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;
  static const _titles = [
    'Your phone has\na story to tell.',
    'Go beneath\nthe screen.',
    'Turn curiosity\ninto confidence.',
  ];
  static const _descriptions = [
    'Learn about mobile technology, one simple lesson at a time. No experience needed.',
    'Explore mobile phone components and discover how tiny parts make big things happen.',
    'Test your knowledge through quizzes, review your answers, and watch your progress grow.',
  ];
  static const _icons = [
    Icons.phone_android_rounded,
    Icons.memory_rounded,
    Icons.quiz_outlined,
  ];

  void _finish() => Navigator.pushReplacement(
    context,
    MaterialPageRoute<void>(builder: (_) => const MainScreen()),
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone_android_rounded,
                      color: AppTheme.blue,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'MOBILE TECH',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextButton(onPressed: _finish, child: const Text('Skip')),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: 3,
                  onPageChanged: (page) => setState(() => _page = page),
                  itemBuilder: (context, index) => LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 24,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                height: 220,
                                decoration: BoxDecoration(
                                  color: AppTheme.navy,
                                  borderRadius: BorderRadius.circular(42),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 144,
                                      height: 144,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white12,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      _icons[index],
                                      color: AppTheme.amber,
                                      size: 86,
                                    ),
                                    Positioned(
                                      top: 18,
                                      child: Container(
                                        width: 40,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 18,
                                      child: Text(
                                        '0${index + 1} / 03',
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          letterSpacing: 3,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 36),
                              Text(
                                _titles[index],
                                textAlign: TextAlign.center,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineLarge,
                              ),
                              const SizedBox(height: 18),
                              Text(
                                _descriptions[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.65,
                                  fontSize: 16,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 16, 28, 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _page == index ? 28 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _page == index
                                ? AppTheme.blue
                                : Theme.of(context).colorScheme.outlineVariant,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _page == 2
                            ? _finish
                            : () => _controller.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                              ),
                        label: Text(_page == 2 ? 'Get Started' : 'Next'),
                        icon: const Icon(Icons.arrow_forward_rounded, size: 20),
                        iconAlignment: IconAlignment.end,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
