class UserRosterItem {
  final String id;
  final String name;
  final String role; // विद्यार्थी, शिक्षक
  final String school;
  final String gradeOrSubject;
  final String joinDate;
  final bool isActive;

  UserRosterItem({
    required this.id,
    required this.name,
    required this.role,
    required this.school,
    required this.gradeOrSubject,
    required this.joinDate,
    this.isActive = true,
  });
}

class SystemStatMetric {
  final String title;
  final String value;
  final String change;
  final bool isPositive;

  SystemStatMetric({
    required this.title,
    required this.value,
    required this.change,
    this.isPositive = true,
  });
}
