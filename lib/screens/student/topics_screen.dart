import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/student_state.dart';
import '../../models/topic.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';
import 'lesson_screen.dart';
import 'quiz_screen.dart';

class TopicsScreen extends StatelessWidget {
  final StudentState studentState;
  final bool isQuizDirectMode;

  const TopicsScreen({
    super.key,
    required this.studentState,
    this.isQuizDirectMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final topics = MockData.topics;

    return ListenableBuilder(
      listenable: studentState,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(isQuizDirectMode ? 'प्रश्नमंजुषा विषय निवडा' : 'पर्यावरण विषय (Topics)'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: PointsBadgeChip(points: studentState.totalPoints),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              itemCount: topics.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.accentMint,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.primaryLight.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.menu_book_rounded, color: AppTheme.primaryGreen, size: 26),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            isQuizDirectMode
                                ? 'कोणत्या विषयाची प्रश्नमंजुषा सोडवायची आहे?'
                                : '${studentState.selectedClass} साठी एकूण ८ पर्यावरण विषय उपलब्ध आहेत.',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final topic = topics[index - 1];
                final isCompleted = studentState.isTopicCompleted(topic.id);

                return _TopicCard(
                  topic: topic,
                  isCompleted: isCompleted,
                  isQuizDirectMode: isQuizDirectMode,
                  onTap: () {
                    if (isQuizDirectMode) {
                      final questions = MockData.quizDatabase[topic.id] ?? MockData.quizDatabase['topic_1']!;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            topic: topic,
                            questions: questions,
                            studentState: studentState,
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonScreen(
                            topic: topic,
                            studentState: studentState,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _TopicCard extends StatelessWidget {
  final Topic topic;
  final bool isCompleted;
  final bool isQuizDirectMode;
  final VoidCallback onTap;

  const _TopicCard({
    required this.topic,
    required this.isCompleted,
    required this.isQuizDirectMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isCompleted ? Colors.green.shade300 : Colors.grey.shade200,
          width: isCompleted ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: topic.themeColor.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: topic.themeColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: topic.themeColor.withValues(alpha: 0.3)),
                  ),
                  child: Icon(topic.icon, color: topic.themeColor, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              topic.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textDark,
                              ),
                            ),
                          ),
                          if (isCompleted)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.green.shade400),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.check_circle_rounded, color: Colors.green.shade700, size: 13),
                                  const SizedBox(width: 4),
                                  Text(
                                    'पूर्ण',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        topic.englishTitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        topic.summary,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.grey.shade700,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: topic.themeColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              topic.bannerTag,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: topic.themeColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            isQuizDirectMode ? 'क्विझ सुरू करा →' : 'धडा वाचा →',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: topic.themeColor,
                            ),
                          ),
                        ],
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
}
