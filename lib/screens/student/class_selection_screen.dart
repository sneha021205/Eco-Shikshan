import 'package:flutter/material.dart';
import '../../models/student_state.dart';
import '../../theme/app_theme.dart';
import 'topics_screen.dart';

class ClassSelectionScreen extends StatelessWidget {
  final StudentState studentState;

  const ClassSelectionScreen({
    super.key,
    required this.studentState,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> classes = [
      {
        'title': 'इयत्ता १–२',
        'subtitle': 'बाल वर्ग (Foundational)',
        'description': 'निसर्गाची ओळख, झाडे, पाळीव प्राणी आणि पक्षी यांची गमतीशीर माहिती.',
        'icon': Icons.child_care_rounded,
        'gradient': const LinearGradient(colors: [Color(0xFF43A047), Color(0xFF66BB6A)]),
        'topicsCount': '६ सोपे घटक',
      },
      {
        'title': 'इयत्ता ३–५',
        'subtitle': 'प्राथमिक स्तर (Primary)',
        'description': 'पाणी, हवा, कचरा आणि आपल्या आजूबाजूचा सुंदर निसर्ग.',
        'icon': Icons.palette_rounded,
        'gradient': const LinearGradient(colors: [Color(0xFF00ACC1), Color(0xFF26C6DA)]),
        'topicsCount': '८ सचित्र घटक',
      },
      {
        'title': 'इयत्ता ६–८',
        'subtitle': 'माध्यमिक स्तर (Middle School)',
        'description': 'परिसंस्था, प्रदूषण, कचरा वर्गीकरण आणि पाणी संवर्धन प्रयोग.',
        'icon': Icons.science_rounded,
        'gradient': const LinearGradient(colors: [Color(0xFF3949AB), Color(0xFF5C6BC0)]),
        'topicsCount': '८ मुख्य विषय व क्विझ',
      },
      {
        'title': 'इयत्ता ९–१०',
        'subtitle': 'उच्च माध्यमिक स्तर (Secondary)',
        'description': 'हवामान बदल, कार्बन फूटप्रिंट, सौर ऊर्जा आणि पर्यावरण कायदे.',
        'icon': Icons.public_rounded,
        'gradient': const LinearGradient(colors: [Color(0xFFE65100), Color(0xFFFF8F00)]),
        'topicsCount': 'प्रगत अभ्यासक्रम',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('इयत्ता निवडा (Select Class)'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.primaryLight.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.school_rounded, color: AppTheme.primaryGreen, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'तुमच्या इयत्तेनुसार योग्य अभ्यासक्रम व प्रश्नमंजुषा निवडा:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              ...classes.map((cls) {
                final isCurrent = studentState.selectedClass == cls['title'];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    gradient: cls['gradient'] as LinearGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: (cls['gradient'] as LinearGradient).colors.first.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        studentState.setSelectedClass(cls['title'] as String);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopicsScreen(studentState: studentState),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.22),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                cls['icon'] as IconData,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        cls['title'] as String,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      if (isCurrent) ...[
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            'सध्याची',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.primaryDark,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    cls['subtitle'] as String,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withValues(alpha: 0.9),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    cls['description'] as String,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withValues(alpha: 0.85),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
