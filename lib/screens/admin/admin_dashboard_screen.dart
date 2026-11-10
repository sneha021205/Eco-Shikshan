import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/admin_data.dart';
import '../../theme/app_theme.dart';
import '../welcome_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<UserRosterItem> _roster = List.from(MockData.userRoster);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showAddUserDialog(String role) {
    final nameCtrl = TextEditingController();
    final schoolCtrl = TextEditingController();
    final extraCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('नवीन $role जोडा'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'नाव')),
            const SizedBox(height: 10),
            TextField(controller: schoolCtrl, decoration: const InputDecoration(labelText: 'शाळा / संस्था')),
            const SizedBox(height: 10),
            TextField(
              controller: extraCtrl,
              decoration: InputDecoration(labelText: role == 'विद्यार्थी' ? 'इयत्ता' : 'विषय / विभाग'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('रद्द करा')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5E35B1)),
            onPressed: () {
              if (nameCtrl.text.isNotEmpty) {
                setState(() {
                  _roster.insert(
                    0,
                    UserRosterItem(
                      id: 'u_${DateTime.now().millisecondsSinceEpoch}',
                      name: '${nameCtrl.text} ($role)',
                      role: role,
                      school: schoolCtrl.text.isEmpty ? 'जिल्हा परिषद शाळा' : schoolCtrl.text,
                      gradeOrSubject: extraCtrl.text.isEmpty ? 'पर्यावरण' : extraCtrl.text,
                      joinDate: 'आज',
                    ),
                  );
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$role यशस्वीरीत्या जोडला गेला!'),
                    backgroundColor: AppTheme.primaryGreen,
                  ),
                );
              }
            },
            child: const Text('जतन करा'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('प्रशासकीय नियंत्रण कक्ष (Admin)'),
        backgroundColor: const Color(0xFF5E35B1),
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
          isScrollable: true,
          tabs: const [
            Tab(text: 'विहंगावलोकन (Overview)', icon: Icon(Icons.analytics_rounded, size: 20)),
            Tab(text: 'विद्यार्थी व्यवस्थापन', icon: Icon(Icons.school_rounded, size: 20)),
            Tab(text: 'शिक्षक व्यवस्थापन', icon: Icon(Icons.badge_rounded, size: 20)),
            Tab(text: 'अभ्यासक्रम व्यवस्थापन', icon: Icon(Icons.library_books_rounded, size: 20)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildUserManagementTab('विद्यार्थी'),
          _buildUserManagementTab('शिक्षक'),
          _buildCurriculumManagementTab(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4527A0), Color(0xFF5E35B1), Color(0xFF7E57C2)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF5E35B1).withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(Icons.shield_rounded, color: Colors.white, size: 40),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'महाराष्ट्र राज्य - इको शिक्षण मंच',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'प्रणाली स्थिती: सक्रिय व सुरक्षित 🟢',
                        style: TextStyle(fontSize: 12.5, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'प्लॅटफॉर्म आकडेवारी (Platform Metrics):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textDark),
          ),

          const SizedBox(height: 12),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: MockData.adminMetrics.map((m) {
              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 3)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(m.title, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    const SizedBox(height: 4),
                    Text(
                      m.value,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5E35B1)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      m.change,
                      style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          const Text(
            'नुकत्याच झालेल्या नोंदी (Recent System Activity):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textDark),
          ),

          const SizedBox(height: 12),

          _buildActivityTile('नवीन शाळा जोडली गेली', 'ज्ञानदीप विद्यालय, सांगली • १० मिनिटांपूर्वी', Icons.domain_rounded),
          _buildActivityTile('नवीन ५० प्रश्नमंजुषा पूर्ण', 'इयत्ता ७वी - पाणी संवर्धन • २५ मिनिटांपूर्वी', Icons.quiz_rounded),
          _buildActivityTile('शिक्षक पडताळणी मंजूर', 'रोहिणी जोशी - सरस्वती हायस्कूल • १ तासापूर्वी', Icons.verified_user_rounded),
        ],
      ),
    );
  }

  Widget _buildUserManagementTab(String roleFilter) {
    final filtered = _roster.where((u) => u.role == roleFilter).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '$roleFilter शोधा (Search)...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5E35B1)),
                onPressed: () => _showAddUserDialog(roleFilter),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: Text('+ नवीन $roleFilter'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final user = filtered[index];
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
                    CircleAvatar(
                      backgroundColor: const Color(0xFFEDE7F6),
                      child: Icon(
                        user.role == 'विद्यार्थी' ? Icons.school_rounded : Icons.person_rounded,
                        color: const Color(0xFF5E35B1),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                          ),
                          Text(
                            '${user.school} • ${user.gradeOrSubject}',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text(
                            'नोंदणी दिनांक: ${user.joinDate}',
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                      onPressed: () {
                        setState(() {
                          _roster.removeWhere((item) => item.id == user.id);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('वापरकर्ता हटवला गेला.')),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCurriculumManagementTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: MockData.topics.length,
      itemBuilder: (context, index) {
        final topic = MockData.topics[index];
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: topic.themeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(topic.icon, color: topic.themeColor, size: 26),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                    ),
                    Text(
                      '${topic.englishTitle} • ${topic.sections.length} उपविभाग',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Text(
                  'प्रकाशित (Live)',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green.shade800),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActivityTile(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF5E35B1), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: AppTheme.textDark)),
                Text(subtitle, style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
