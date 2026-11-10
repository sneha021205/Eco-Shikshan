import 'package:flutter/material.dart';
import '../../models/student_state.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';
import 'class_selection_screen.dart';
import 'topics_screen.dart';
import 'progress_screen.dart';
import 'eco_games_screen.dart';
import '../welcome_screen.dart';

class StudentDashboardScreen extends StatelessWidget {
  final StudentState? studentState;

  const StudentDashboardScreen({
    super.key,
    this.studentState,
  });

  @override
  Widget build(BuildContext context) {
    // Look up or fallback to a local instance if not passed via inherited widget
    final state = studentState ?? _StateInherited.of(context);

    return ListenableBuilder(
      listenable: state,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('इको शिक्षण दालन'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: PointsBadgeChip(
                  points: state.totalPoints,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgressScreen(studentState: state),
                      ),
                    );
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.logout_rounded),
                tooltip: 'बाहेर पडा',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Profile & Level Card
                  _buildProfileCard(context, state),

                  const SizedBox(height: 20),

                  // 2. Daily Eco Fact Card (पर्यावरण ज्ञानकण)
                  _buildDailyEcoFactCard(),

                  const SizedBox(height: 22),

                  // 3. Section Title: मुख्य विभाग (Main Modules)
                  const Row(
                    children: [
                      Icon(Icons.dashboard_customize_rounded, color: AppTheme.primaryGreen, size: 22),
                      SizedBox(width: 8),
                      Text(
                        'अभ्यास व उपक्रम (Learning & Fun)',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // 4. Action Grid: Lessons, Quizzes, Games, Progress
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.1,
                    children: [
                      _DashboardActionCard(
                        title: 'पर्यावरण धडे',
                        subtitle: '८ विषय व संकल्पना',
                        icon: Icons.menu_book_rounded,
                        color: const Color(0xFF2E7D32),
                        badgeText: 'अभ्यासक्रम',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassSelectionScreen(studentState: state),
                            ),
                          );
                        },
                      ),
                      _DashboardActionCard(
                        title: 'प्रश्नमंजुषा',
                        subtitle: 'ज्ञान तपासा व गुण जिंका',
                        icon: Icons.quiz_rounded,
                        color: const Color(0xFF0288D1),
                        badgeText: 'क्विझ',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopicsScreen(
                                studentState: state,
                                isQuizDirectMode: true,
                              ),
                            ),
                          );
                        },
                      ),
                      _DashboardActionCard(
                        title: 'इको खेळ',
                        subtitle: 'कचरा वर्गीकरण गेम',
                        icon: Icons.sports_esports_rounded,
                        color: const Color(0xFFE65100),
                        badgeText: 'मजेदार खेळ',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EcoGamesScreen(studentState: state),
                            ),
                          );
                        },
                      ),
                      _DashboardActionCard(
                        title: 'माझी प्रगती',
                        subtitle: 'बॅजेस व प्रमाणपत्र',
                        icon: Icons.emoji_events_rounded,
                        color: const Color(0xFF8E24AA),
                        badgeText: 'प्रगती',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProgressScreen(studentState: state),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // 5. Recent Badges Strip
                  _buildBadgesPreview(context, state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileCard(BuildContext context, StudentState state) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppTheme.heroGradient,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withValues(alpha: 0.3),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.sentiment_very_satisfied_rounded,
                  size: 38,
                  color: AppTheme.primaryGreen,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'नमस्ते, ${state.studentName}! 👋',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${state.selectedClass} • ${state.currentLevel}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Progress meter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'एकूण अभ्यास प्रगती (Overall Progress)',
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${state.completedLessonsCount} / ८ विषय पूर्ण',
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                EcoProgressBar(
                  progress: state.completedLessonsCount / 8,
                  color: Colors.amberAccent,
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyEcoFactCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.accentMint,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.primaryLight.withValues(alpha: 0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.lightbulb_rounded, color: AppTheme.ecoAmber, size: 24),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'आजचा पर्यावरण ज्ञानकण (Eco Fact):',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryDark,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'एक मोठे झाड एका वर्षात एका व्यक्तीला दिवसभर पुरेल इतका प्राणवायू (Oxygen) देते आणि २२ किलो कार्बन शोषून घेते!',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textDark,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesPreview(BuildContext context, StudentState state) {
    final unlockedBadges = state.badges.where((b) => b.isUnlocked).toList();

    return EcoCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProgressScreen(studentState: state),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.military_tech_rounded, color: AppTheme.ecoAmber, size: 22),
                  SizedBox(width: 6),
                  Text(
                    'माझे मिळवलेले सन्मानचिन्हे (Badges)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                'सर्व पहा (${unlockedBadges.length}/${state.badges.length}) →',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.primaryGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: state.badges.take(4).map((badge) {
              return Column(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: badge.isUnlocked ? badge.color.withValues(alpha: 0.18) : Colors.grey.shade200,
                      border: Border.all(
                        color: badge.isUnlocked ? badge.color : Colors.grey.shade400,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      badge.isUnlocked ? badge.icon : Icons.lock_outline_rounded,
                      color: badge.isUnlocked ? badge.color : Colors.grey.shade500,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    badge.titleMarathi,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: badge.isUnlocked ? FontWeight.bold : FontWeight.normal,
                      color: badge.isUnlocked ? AppTheme.textDark : Colors.grey.shade600,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _DashboardActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String badgeText;
  final VoidCallback onTap;

  const _DashboardActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.badgeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: color, size: 26),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        badgeText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Inherited fallback provider for clean widget scoping
class _StateInherited extends InheritedWidget {
  final StudentState state;

  const _StateInherited({
    required this.state,
    required super.child,
  });

  static StudentState of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<_StateInherited>();
    return provider?.state ?? _globalStudentState;
  }

  @override
  bool updateShouldNotify(covariant _StateInherited oldWidget) => state != oldWidget.state;
}

final StudentState _globalStudentState = StudentState();
