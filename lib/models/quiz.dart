class QuizQuestion {
  final String id;
  final String topicId;
  final String questionMarathi;
  final List<String> options;
  final int correctOptionIndex;
  final String explanationMarathi;

  QuizQuestion({
    required this.id,
    required this.topicId,
    required this.questionMarathi,
    required this.options,
    required this.correctOptionIndex,
    required this.explanationMarathi,
  });
}

class QuizResult {
  final String topicId;
  final String topicTitle;
  final int totalQuestions;
  final int correctAnswers;
  final int pointsEarned;
  final DateTime timestamp;

  QuizResult({
    required this.topicId,
    required this.topicTitle,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.pointsEarned,
    required this.timestamp,
  });

  double get percentage => (correctAnswers / totalQuestions) * 100;
}
