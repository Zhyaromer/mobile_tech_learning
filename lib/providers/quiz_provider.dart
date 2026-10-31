import 'package:flutter/foundation.dart';
import '../data/questions_data.dart';
import '../models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  String? _moduleId;
  List<Question> _questions = [];
  final List<int> _answers = [];
  final Map<String, QuizResult> _latestResults = {};
  int _currentIndex = 0;
  int? _selectedAnswer;
  bool _isComplete = false;

  String? get moduleId => _moduleId;
  List<Question> get questions => List.unmodifiable(_questions);
  List<int> get answers => List.unmodifiable(_answers);
  Map<String, QuizResult> get latestResults => Map.unmodifiable(_latestResults);
  int get currentIndex => _currentIndex;
  int? get selectedAnswer => _selectedAnswer;
  bool get isComplete => _isComplete;
  bool get isLastQuestion => _currentIndex == _questions.length - 1;
  Question get currentQuestion => _questions[_currentIndex];
  int get score {
    var correct = 0;
    for (var i = 0; i < _answers.length; i++) {
      if (_answers[i] == _questions[i].correctIndex) correct++;
    }
    return correct;
  }

  QuizResult get result => QuizResult(
    moduleId: _moduleId!,
    correct: score,
    total: _questions.length,
  );

  void startQuiz(String moduleId) {
    final questions = questionsByModule[moduleId];
    if (questions == null || questions.isEmpty) return;
    _moduleId = moduleId;
    _questions = questions;
    _answers.clear();
    _currentIndex = 0;
    _selectedAnswer = null;
    _isComplete = false;
    notifyListeners();
  }

  void selectAnswer(int index) {
    if (_isComplete ||
        _questions.isEmpty ||
        index < 0 ||
        index >= currentQuestion.answers.length) {
      return;
    }
    _selectedAnswer = index;
    notifyListeners();
  }

  void nextQuestion() {
    if (_selectedAnswer == null || _isComplete || _questions.isEmpty) return;
    _answers.add(_selectedAnswer!);
    _selectedAnswer = null;
    if (isLastQuestion) {
      _isComplete = true;
      _latestResults[_moduleId!] = result;
    } else {
      _currentIndex++;
    }
    notifyListeners();
  }

  void resetScores() {
    _latestResults.clear();
    _moduleId = null;
    _questions = [];
    _answers.clear();
    _currentIndex = 0;
    _selectedAnswer = null;
    _isComplete = false;
    notifyListeners();
  }
}
