import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';
import 'teacher_dashboard_screen.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({super.key});

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  final _emailController = TextEditingController(text: 'sunil.joshi@school.edu');
  final _passwordController = TextEditingController(text: 'teacher123');
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() => _isLoading = false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TeacherDashboardScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('शिक्षक पोर्टल लॉगिन'),
        backgroundColor: const Color(0xFF0288D1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE1F5FE),
                      border: Border.all(color: const Color(0xFF0288D1), width: 2),
                    ),
                    child: const Icon(
                      Icons.person_search_rounded,
                      size: 50,
                      color: Color(0xFF0288D1),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'शिक्षक दालन (Teacher Portal)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'पर्यावरण वर्ग व विद्यार्थी प्रगती व्यवस्थापन',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.5, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 28),

                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'शिक्षक ईमेल / युझरनेम',
                    prefixIcon: Icon(Icons.email_outlined, color: Color(0xFF0288D1)),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'पासवर्ड',
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF0288D1)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                EcoPrimaryButton(
                  label: 'शिक्षक म्हणून लॉगिन करा',
                  icon: Icons.login_rounded,
                  backgroundColor: const Color(0xFF0288D1),
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1F5FE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: Color(0xFF0288D1), size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'डेमो: शिक्षक खात्यासाठी पूर्व-भरलेले क्रेडेन्शियल वापरून लॉगिन करा.',
                          style: TextStyle(fontSize: 12, color: Color(0xFF01579B)),
                        ),
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
