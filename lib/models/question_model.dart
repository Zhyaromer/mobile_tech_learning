class Question {
  const Question({
    required this.prompt,
    required this.answers,
    required this.correctIndex,
    required this.explanation,
  });

  final String prompt;
  final List<String> answers;
  final int correctIndex;
  final String explanation;
}

class QuizResult {
  const QuizResult({
    required this.moduleId,
    required this.correct,
    required this.total,
  });

  final String moduleId;
  final int correct;
  final int total;
  int get wrong => total - correct;
  int get percentage => total == 0 ? 0 : (correct / total * 100).round();
}
