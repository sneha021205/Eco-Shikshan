class StudentProgressRecord {
  final String id;
  final String nameMarathi;
  final String className;
  final int points;
  final int completedLessons;
  final double averageQuizScore;
  final String status;

  StudentProgressRecord({
    required this.id,
    required this.nameMarathi,
    required this.className,
    required this.points,
    required this.completedLessons,
    required this.averageQuizScore,
    required this.status,
  });
}

class TeacherClass {
  final String id;
  final String name;
  final int studentCount;
  final double completionRate;
  final String topTopic;

  TeacherClass({
    required this.id,
    required this.name,
    required this.studentCount,
    required this.completionRate,
    required this.topTopic,
  });
}

class LessonDraft {
  final String titleMarathi;
  final String grade;
  final String topicCategory;
  final String keyPoints;
  final String actionTip;

  LessonDraft({
    required this.titleMarathi,
    required this.grade,
    required this.topicCategory,
    required this.keyPoints,
    required this.actionTip,
  });
}
