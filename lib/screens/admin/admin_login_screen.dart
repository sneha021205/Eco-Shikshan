import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';
import 'admin_dashboard_screen.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _adminIdController = TextEditingController(text: 'admin@eco-shikshan.gov.in');
  final _passwordController = TextEditingController(text: 'adminSecure2026');
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _adminIdController.dispose();
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
          builder: (context) => const AdminDashboardScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('प्रशासक लॉगिन (Admin Portal)'),
        backgroundColor: const Color(0xFF5E35B1),
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
                      color: const Color(0xFFEDE7F6),
                      border: Border.all(color: const Color(0xFF5E35B1), width: 2),
                    ),
                    child: const Icon(
                      Icons.admin_panel_settings_rounded,
                      size: 50,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'प्रशासकीय नियंत्रण कक्ष',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'शाळा, शिक्षक, विद्यार्थी आणि अभ्यासक्रम व्यवस्थापन',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.5, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 28),

                TextField(
                  controller: _adminIdController,
                  decoration: const InputDecoration(
                    labelText: 'प्रशासक ईमेल / आयडी',
                    prefixIcon: Icon(Icons.security_rounded, color: Color(0xFF5E35B1)),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'सुरक्षा पासवर्ड',
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF5E35B1)),
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
                  label: 'प्रशासक म्हणून प्रवेश करा',
                  icon: Icons.vpn_key_rounded,
                  backgroundColor: const Color(0xFF5E35B1),
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.verified_user_rounded, color: Color(0xFF5E35B1), size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'डेमो: प्रशासक डॅशबोर्ड पाहण्यासाठी थेट लॉगिन करू शकता.',
                          style: TextStyle(fontSize: 12, color: Color(0xFF311B92)),
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
