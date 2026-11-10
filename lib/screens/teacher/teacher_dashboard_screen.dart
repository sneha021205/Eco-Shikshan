import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/teacher_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';
import '../welcome_screen.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({super.key});

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<StudentProgressRecord> _students = List.from(MockData.studentRecords);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showAddLessonModal() {
    final titleController = TextEditingController();
    final gradeController = TextEditingController(text: 'इयत्ता ६–८');
    final pointsController = TextEditingController();
    final actionController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'नवीन धडा जोडा (Add Lesson)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'धड्याचे शीर्षक (उदा. सेंद्रिय शेती पद्धती)'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: gradeController,
                decoration: const InputDecoration(labelText: 'इयत्ता गट'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: pointsController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'महत्त्वाचे मुद्दे व माहिती'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: actionController,
                decoration: const InputDecoration(labelText: 'पर्यावरण मित्र कृती (Daily Action Tip)'),
              ),
              const SizedBox(height: 18),
              EcoPrimaryButton(
                label: 'धडा प्रकाशित करा (Publish Lesson)',
                icon: Icons.upload_file_rounded,
                backgroundColor: const Color(0xFF0288D1),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('नवीन धडा यशस्वीरीत्या जोडला गेला! 📖'),
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

  void _showAddQuizModal() {
    final qController = TextEditingController();
    final op1Controller = TextEditingController();
    final op2Controller = TextEditingController();
    final op3Controller = TextEditingController();
    final op4Controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'नवीन प्रश्नमंजुषा जोडा (Add Quiz)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: qController,
                decoration: const InputDecoration(labelText: 'मराठी प्रश्न टाका'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: op1Controller,
                decoration: const InputDecoration(labelText: 'पर्याय १ (योग्य उत्तर)'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: op2Controller,
                decoration: const InputDecoration(labelText: 'पर्याय २'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: op3Controller,
                decoration: const InputDecoration(labelText: 'पर्याय ३'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: op4Controller,
                decoration: const InputDecoration(labelText: 'पर्याय ४'),
              ),
              const SizedBox(height: 18),
              EcoPrimaryButton(
                label: 'प्रश्नमंजुषा जतन करा (Save Quiz)',
                icon: Icons.quiz_rounded,
                backgroundColor: const Color(0xFF0288D1),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('नवीन प्रश्नमंजुषा यशस्वीरीत्या तयार केली! 🎯'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('शिक्षक डॅशबोर्ड (Teacher Dashboard)'),
        backgroundColor: const Color(0xFF0288D1),
        actions: [
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'वर्ग विहंगावलोकन', icon: Icon(Icons.class_rounded, size: 20)),
            Tab(text: 'विद्यार्थी प्रगती', icon: Icon(Icons.people_alt_rounded, size: 20)),
            Tab(text: 'साहित्य व्यवस्थापन', icon: Icon(Icons.library_books_rounded, size: 20)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildClassesTab(),
          _buildStudentProgressTab(),
          _buildContentManagementTab(),
        ],
      ),
    );
  }

  Widget _buildClassesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Teacher Profile Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0277BD), Color(0xFF0288D1), Color(0xFF29B6F6)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF0288D1).withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person_rounded, color: Color(0xFF0288D1), size: 32),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'सुनील जोशी (पर्यावरण विभागप्रमुख)',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'सरस्वती विद्यामंदिर, पुणे • ३ सक्रिय वर्ग',
                        style: TextStyle(fontSize: 12.5, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Quick Summary Cards
          Row(
            children: [
              _buildMetricCard('एकूण विद्यार्थी', '११५', Icons.school_rounded, const Color(0xFF0288D1)),
              const SizedBox(width: 12),
              _buildMetricCard('सरासरी गुण', '८८.५%', Icons.stars_rounded, const Color(0xFF2E7D32)),
              const SizedBox(width: 12),
              _buildMetricCard('अभ्यासक्रम पूर्ण', '८०%', Icons.task_alt_rounded, const Color(0xFFE65100)),
            ],
          ),

          const SizedBox(height: 22),

          const Text(
            'माझे वर्ग (My Assigned Classes):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textDark),
          ),

          const SizedBox(height: 12),

          ...MockData.teacherClasses.map((cls) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cls.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1F5FE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${cls.studentCount} विद्यार्थी',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0288D1)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'सर्वाधिक शिकलेला विषय: ${cls.topTopic}',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: EcoProgressBar(
                          progress: cls.completionRate,
                          color: const Color(0xFF0288D1),
                          height: 8,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${(cls.completionRate * 100).toInt()}%',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0288D1)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildStudentProgressTab() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      itemCount: _students.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5FE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                Icon(Icons.leaderboard_rounded, color: Color(0xFF0288D1)),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'विद्यार्थ्यांचे गुण, पूर्ण केलेले धडे आणि क्रमवारी (Leaderboard):',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF01579B)),
                  ),
                ),
              ],
            ),
          );
        }

        final student = _students[index - 1];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.accentMint,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '#$index',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryDark),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.nameMarathi,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${student.className} • ${student.completedLessons} धडे पूर्ण • ${student.averageQuizScore}% क्विझ',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppTheme.amberGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${student.points} गुण',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContentManagementTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: EcoPrimaryButton(
                  label: '+ धडा जोडा',
                  icon: Icons.note_add_rounded,
                  backgroundColor: const Color(0xFF0288D1),
                  height: 48,
                  onPressed: _showAddLessonModal,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: EcoPrimaryButton(
                  label: '+ क्विझ जोडा',
                  icon: Icons.add_task_rounded,
                  backgroundColor: const Color(0xFF2E7D32),
                  height: 48,
                  onPressed: _showAddQuizModal,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'सध्याचे अभ्यासक्रम साहित्य (Active Content):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textDark),
          ),

          const SizedBox(height: 12),

          ...MockData.topics.take(4).map((t) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(t.icon, color: t.themeColor, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.title,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                        ),
                        Text(
                          '${t.sections.length} उपघटक • ३ प्रश्नमंजुषा प्रश्न',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_note_rounded, color: Color(0xFF0288D1)),
                    tooltip: 'संपादित करा',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${t.title} संपादन स्क्रीन उघडत आहे...')),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(color: color.withValues(alpha: 0.06), blurRadius: 8, offset: const Offset(0, 3)),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
