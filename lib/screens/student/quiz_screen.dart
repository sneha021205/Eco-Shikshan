import 'package:flutter/material.dart';
import '../../models/quiz.dart';
import '../../models/student_state.dart';
import '../../models/topic.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';
import 'progress_screen.dart';

class QuizScreen extends StatefulWidget {
  final Topic topic;
  final List<QuizQuestion> questions;
  final StudentState studentState;

  const QuizScreen({
    super.key,
    required this.topic,
    required this.questions,
    required this.studentState,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOptionIndex;
  bool _isAnswerSubmitted = false;
  int _correctCount = 0;

  QuizQuestion get _currentQuestion => widget.questions[_currentIndex];

  void _selectOption(int index) {
    if (_isAnswerSubmitted) return;
    setState(() {
      _selectedOptionIndex = index;
    });
  }

  void _submitAnswer() {
    if (_selectedOptionIndex == null) return;
    setState(() {
      _isAnswerSubmitted = true;
      if (_selectedOptionIndex == _currentQuestion.correctOptionIndex) {
        _correctCount++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOptionIndex = null;
        _isAnswerSubmitted = false;
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    final earnedPoints = _correctCount * 30 + 10;
    final result = QuizResult(
      topicId: widget.topic.id,
      topicTitle: widget.topic.title,
      totalQuestions: widget.questions.length,
      correctAnswers: _correctCount,
      pointsEarned: earnedPoints,
      timestamp: DateTime.now(),
    );

    widget.studentState.recordQuizResult(result);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.amberGradient,
              ),
              child: const Center(
                child: Icon(Icons.emoji_events_rounded, size: 48, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'अभिनंदन! 🎉',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'तुम्ही ${widget.topic.title} प्रश्नमंजुषा पूर्ण केली!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.accentMint,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'गुण: $_correctCount / ${widget.questions.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '+$earnedPoints इको पॉइन्ट्स जमा झाले! 🌿',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            EcoPrimaryButton(
              label: 'माझी प्रगती पहा (View Progress)',
              icon: Icons.analytics_rounded,
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressScreen(studentState: widget.studentState),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Back to previous
              },
              child: const Text(
                'दालनात परत जा',
                style: TextStyle(color: AppTheme.primaryGreen, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == widget.questions.length - 1;
    final progress = (_currentIndex + 1) / widget.questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.topic.title} क्विझ'),
        backgroundColor: widget.topic.themeColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_currentIndex + 1} / ${widget.questions.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Progress Bar
            EcoProgressBar(
              progress: progress,
              color: widget.topic.themeColor,
              height: 6,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Question Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: widget.topic.themeColor.withValues(alpha: 0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: widget.topic.themeColor.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'प्रश्न ${_currentIndex + 1}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: widget.topic.themeColor,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.help_outline_rounded, color: Colors.grey, size: 20),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(
                            _currentQuestion.questionMarathi,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textDark,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Options List
                    ..._currentQuestion.options.asMap().entries.map((entry) {
                      final optIndex = entry.key;
                      final optionText = entry.value;

                      Color borderColor = Colors.grey.shade300;
                      Color bgColor = Colors.white;
                      Color textColor = AppTheme.textDark;
                      IconData? statusIcon;

                      if (_isAnswerSubmitted) {
                        if (optIndex == _currentQuestion.correctOptionIndex) {
                          borderColor = Colors.green;
                          bgColor = Colors.green.shade50;
                          textColor = Colors.green.shade900;
                          statusIcon = Icons.check_circle_rounded;
                        } else if (optIndex == _selectedOptionIndex) {
                          borderColor = Colors.red;
                          bgColor = Colors.red.shade50;
                          textColor = Colors.red.shade900;
                          statusIcon = Icons.cancel_rounded;
                        }
                      } else if (_selectedOptionIndex == optIndex) {
                        borderColor = widget.topic.themeColor;
                        bgColor = widget.topic.themeColor.withValues(alpha: 0.08);
                        textColor = widget.topic.themeColor;
                      }

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: borderColor, width: _selectedOptionIndex == optIndex ? 2 : 1),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => _selectOption(optIndex),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _selectedOptionIndex == optIndex
                                          ? (_isAnswerSubmitted
                                              ? (optIndex == _currentQuestion.correctOptionIndex ? Colors.green : Colors.red)
                                              : widget.topic.themeColor)
                                          : Colors.grey.shade100,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${optIndex + 1}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: _selectedOptionIndex == optIndex ? Colors.white : Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      optionText,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                  if (statusIcon != null)
                                    Icon(
                                      statusIcon,
                                      color: optIndex == _currentQuestion.correctOptionIndex ? Colors.green : Colors.red,
                                      size: 24,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

                    // Explanation Box (Shown after submission)
                    if (_isAnswerSubmitted) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: _selectedOptionIndex == _currentQuestion.correctOptionIndex
                              ? Colors.green.shade50
                              : Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: _selectedOptionIndex == _currentQuestion.correctOptionIndex
                                ? Colors.green.shade300
                                : Colors.amber.shade400,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              _selectedOptionIndex == _currentQuestion.correctOptionIndex
                                  ? Icons.check_circle_outline_rounded
                                  : Icons.info_outline_rounded,
                              color: _selectedOptionIndex == _currentQuestion.correctOptionIndex
                                  ? Colors.green.shade800
                                  : Colors.orange.shade800,
                              size: 22,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'स्पष्टीकरण: ${_currentQuestion.explanationMarathi}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade900,
                                  height: 1.35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Bottom Action Bar
            Padding(
              padding: const EdgeInsets.all(18),
              child: !_isAnswerSubmitted
                  ? EcoPrimaryButton(
                      label: 'उत्तर तपासा (Check Answer)',
                      icon: Icons.check_rounded,
                      backgroundColor: widget.topic.themeColor,
                      onPressed: _selectedOptionIndex == null ? () {} : _submitAnswer,
                    )
                  : EcoPrimaryButton(
                      label: isLast ? 'निकाल पहा (View Results) 🏆' : 'पुढील प्रश्न (Next Question) →',
                      icon: isLast ? Icons.emoji_events_rounded : Icons.arrow_forward_rounded,
                      backgroundColor: widget.topic.themeColor,
                      onPressed: _nextQuestion,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
