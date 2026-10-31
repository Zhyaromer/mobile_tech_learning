class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.fact,
    required this.example,
    this.minutes = 3,
  });

  final String id;
  final String title;
  final List<String> content;
  final String fact;
  final String example;
  final int minutes;
}
