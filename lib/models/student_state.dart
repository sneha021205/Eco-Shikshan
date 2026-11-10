import 'package:flutter/material.dart';
import 'badge.dart';
import 'quiz.dart';

class StudentState extends ChangeNotifier {
  String _studentName = "आरव पाटील";
  String _selectedClass = "इयत्ता ६–८";
  int _totalPoints = 350;
  final Set<String> _completedTopicIds = {'topic_1', 'topic_5'};
  final List<QuizResult> _quizResults = [];
  List<EcoBadge> _badges = [];

  StudentState() {
    _initBadges();
  }

  String get studentName => _studentName;
  String get selectedClass => _selectedClass;
  int get totalPoints => _totalPoints;
  Set<String> get completedTopicIds => _completedTopicIds;
  List<QuizResult> get quizResults => _quizResults;
  List<EcoBadge> get badges => _badges;

  int get completedLessonsCount => _completedTopicIds.length;
  
  String get currentLevel {
    if (_totalPoints >= 1000) return 'पर्यावरण रक्षक (Master)';
    if (_totalPoints >= 600) return 'पर्यावरण मित्र (Hero)';
    if (_totalPoints >= 300) return 'निसर्ग दूत (Explorer)';
    return 'बाल रक्षक (Beginner)';
  }

  void setStudentName(String name) {
    _studentName = name;
    notifyListeners();
  }

  void setSelectedClass(String className) {
    _selectedClass = className;
    notifyListeners();
  }

  void addPoints(int points) {
    _totalPoints += points;
    _updateBadges();
    notifyListeners();
  }

  void completeTopic(String topicId, {int points = 50}) {
    if (!_completedTopicIds.contains(topicId)) {
      _completedTopicIds.add(topicId);
      _totalPoints += points;
      _updateBadges();
      notifyListeners();
    }
  }

  bool isTopicCompleted(String topicId) {
    return _completedTopicIds.contains(topicId);
  }

  void recordQuizResult(QuizResult result) {
    _quizResults.add(result);
    _totalPoints += result.pointsEarned;
    _completedTopicIds.add(result.topicId);
    _updateBadges();
    notifyListeners();
  }

  void _initBadges() {
    _badges = [
      EcoBadge(
        id: 'badge_starter',
        titleMarathi: 'पहिले पाऊल',
        descriptionMarathi: 'पहिला धडा यशस्वीरीत्या पूर्ण केला',
        icon: Icons.eco_rounded,
        color: const Color(0xFF4CAF50),
        requiredPoints: 50,
        isUnlocked: true,
      ),
      EcoBadge(
        id: 'badge_water',
        titleMarathi: 'जल मित्र',
        descriptionMarathi: 'पाणी संवर्धन प्रश्नमंजुषेत १००% गुण',
        icon: Icons.water_drop_rounded,
        color: const Color(0xFF0288D1),
        requiredPoints: 200,
        isUnlocked: true,
      ),
      EcoBadge(
        id: 'badge_waste',
        titleMarathi: 'स्वच्छता नायक',
        descriptionMarathi: 'कचरा वर्गीकरण खेळ जिंकला',
        icon: Icons.delete_outline_rounded,
        color: const Color(0xFF8D6E63),
        requiredPoints: 350,
        isUnlocked: true,
      ),
      EcoBadge(
        id: 'badge_tree',
        titleMarathi: 'वृक्ष रक्षक',
        descriptionMarathi: 'पर्यावरण परिसंस्थेचे ज्ञान मिळवले',
        icon: Icons.park_rounded,
        color: const Color(0xFF2E7D32),
        requiredPoints: 500,
        isUnlocked: false,
      ),
      EcoBadge(
        id: 'badge_energy',
        titleMarathi: 'ऊर्जा योद्धा',
        descriptionMarathi: 'हवामान बदल अभ्यासक्रम पूर्ण केला',
        icon: Icons.bolt_rounded,
        color: const Color(0xFFFFB300),
        requiredPoints: 750,
        isUnlocked: false,
      ),
      EcoBadge(
        id: 'badge_master',
        titleMarathi: 'इको चॅम्पियन',
        descriptionMarathi: 'सर्व ८ विषय व प्रश्नमंजुषा पूर्ण केल्या',
        icon: Icons.military_tech_rounded,
        color: const Color(0xFF9C27B0),
        requiredPoints: 1000,
        isUnlocked: false,
      ),
    ];
    _updateBadges();
  }

  void _updateBadges() {
    _badges = _badges.map((b) {
      if (_totalPoints >= b.requiredPoints) {
        return b.copyWith(isUnlocked: true);
      }
      return b;
    }).toList();
  }
}
