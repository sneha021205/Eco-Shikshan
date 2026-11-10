import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/student_state.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';

class ProgressScreen extends StatelessWidget {
  final StudentState studentState;

  const ProgressScreen({
    super.key,
    required this.studentState,
  });

  void _showCertificateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.amber.shade400, width: 3),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.workspace_premium_rounded, size: 54, color: AppTheme.ecoAmber),
              const SizedBox(height: 10),
              const Text(
                'पर्यावरण रक्षक प्रमाणपत्र',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.primaryDark,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Eco Shikshan - Certificate of Excellence',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const Divider(height: 24, thickness: 1.2),
              Text(
                'हे प्रमाणित करण्यात येते की, विद्यार्थी',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 6),
              Text(
                studentState.studentName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'यांनी ${studentState.selectedClass} चे पर्यावरण शिक्षण धडे व प्रश्नमंजुषा यशस्वीरीत्या पूर्ण करून एकूण ${studentState.totalPoints} इको पॉइन्ट्स मिळवले आहेत.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade800, height: 1.4),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.eco_rounded, color: AppTheme.primaryGreen, size: 24),
                      Text('इको शिक्षण मंडळ', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.verified_rounded, color: Colors.blue, size: 24),
                      Text('प्रमाणित २०२६', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              EcoPrimaryButton(
                label: 'प्रमाणपत्र डाउनलोड करा (Save)',
                icon: Icons.download_rounded,
                height: 48,
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('प्रमाणपत्र डाउनलोड झाले! 📜'),
                      backgroundColor: AppTheme.primaryGreen,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final unlockedBadges = studentState.badges.where((b) => b.isUnlocked).toList();

    return ListenableBuilder(
      listenable: studentState,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('माझी पर्यावरण प्रगती (Progress)'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Hero Score Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: AppTheme.heroGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryGreen.withValues(alpha: 0.35),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  studentState.studentName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  studentState.currentLevel,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: AppTheme.amberGradient,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.eco_rounded, color: Colors.white, size: 18),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${studentState.totalPoints} गुण',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Stats Grid in banner
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatItem('पूर्ण धडे', '${studentState.completedLessonsCount} / ८', Icons.menu_book_rounded),
                            _buildStatItem('सन्मानचिन्हे', '${unlockedBadges.length} / ${studentState.badges.length}', Icons.military_tech_rounded),
                            _buildStatItem('क्विझ अचूकता', '९०%', Icons.check_circle_rounded),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 2. Certificate Callout
                  EcoCard(
                    color: const Color(0xFFFFFDE7),
                    border: BorderSide(color: Colors.amber.shade300, width: 1.2),
                    onTap: () => _showCertificateDialog(context),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: AppTheme.amberGradient,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 28),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'पर्यावरण रक्षक प्रमाणपत्र',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textDark,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'आपले अधिकृत ई-प्रमाणपत्र पाहण्यासाठी येथे टॅप करा',
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.ecoAmber, size: 18),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 3. Badges Section
                  const Row(
                    children: [
                      Icon(Icons.military_tech_rounded, color: AppTheme.ecoAmber, size: 22),
                      SizedBox(width: 8),
                      Text(
                        'पर्यावरण सन्मानचिन्हे (Badges)',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.35,
                    ),
                    itemCount: studentState.badges.length,
                    itemBuilder: (context, index) {
                      final badge = studentState.badges[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: badge.isUnlocked ? badge.color.withValues(alpha: 0.4) : Colors.grey.shade300,
                            width: badge.isUnlocked ? 1.5 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: badge.isUnlocked ? badge.color.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: badge.isUnlocked ? badge.color.withValues(alpha: 0.15) : Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    badge.isUnlocked ? badge.icon : Icons.lock_rounded,
                                    color: badge.isUnlocked ? badge.color : Colors.grey.shade400,
                                    size: 22,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: badge.isUnlocked ? Colors.green.shade50 : Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    badge.isUnlocked ? 'मिळाले ✔' : '${badge.requiredPoints} गुण',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: badge.isUnlocked ? Colors.green.shade800 : Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  badge.titleMarathi,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: badge.isUnlocked ? AppTheme.textDark : Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  badge.descriptionMarathi,
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    color: Colors.grey.shade600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 22),

                  // 4. Completed Lessons List
                  const Row(
                    children: [
                      Icon(Icons.checklist_rounded, color: AppTheme.primaryGreen, size: 22),
                      SizedBox(width: 8),
                      Text(
                        'अभ्यासक्रम प्रगती (Curriculum Checklist)',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ...MockData.topics.map((t) {
                    final isDone = studentState.isTopicCompleted(t.id);
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isDone ? Colors.green.shade200 : Colors.grey.shade200,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isDone ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                            color: isDone ? AppTheme.primaryGreen : Colors.grey.shade400,
                            size: 22,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              t.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
                                color: isDone ? AppTheme.textDark : Colors.grey.shade600,
                              ),
                            ),
                          ),
                          Text(
                            isDone ? '+५० गुण' : 'बाकी',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isDone ? AppTheme.primaryGreen : Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
