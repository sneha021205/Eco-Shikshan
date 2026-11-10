import 'package:flutter/material.dart';
import '../../models/student_state.dart';
import '../../theme/app_theme.dart';
import '../../widgets/eco_widgets.dart';

class WasteItem {
  final String name;
  final IconData icon;
  final bool isWet; // true = ओला कचरा, false = सुका कचरा

  WasteItem(this.name, this.icon, this.isWet);
}

class EcoGamesScreen extends StatefulWidget {
  final StudentState studentState;

  const EcoGamesScreen({
    super.key,
    required this.studentState,
  });

  @override
  State<EcoGamesScreen> createState() => _EcoGamesScreenState();
}

class _EcoGamesScreenState extends State<EcoGamesScreen> {
  final List<WasteItem> _items = [
    WasteItem('भाजीपाल्याचे अवशेष', Icons.eco_rounded, true),
    WasteItem('प्लास्टिक बाटली', Icons.local_drink_rounded, false),
    WasteItem('केळीचे साल', Icons.lunch_dining_rounded, true),
    WasteItem('जुन्या वृत्तपत्रांचा कागद', Icons.newspaper_rounded, false),
    WasteItem('काचेची बाटली', Icons.wine_bar_rounded, false),
    WasteItem('चहाची पत्ती', Icons.emoji_food_beverage_rounded, true),
  ];

  int _currentIndex = 0;
  int _gameScore = 0;
  bool _isGameOver = false;

  void _handleChoice(bool chosenIsWet) {
    final currentItem = _items[_currentIndex];
    final isCorrect = (currentItem.isWet == chosenIsWet);

    if (isCorrect) {
      _gameScore += 20;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('बरोबर उत्तर! +२० गुण 🎉 (${currentItem.name} -> ${chosenIsWet ? "ओला कचरा" : "सुका कचरा"})'),
          backgroundColor: AppTheme.primaryGreen,
          duration: const Duration(milliseconds: 1000),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('चूक! ${currentItem.name} हा ${currentItem.isWet ? "ओला कचरा" : "सुका कचरा"} आहे.'),
          backgroundColor: Colors.red.shade700,
          duration: const Duration(milliseconds: 1400),
        ),
      );
    }

    if (_currentIndex < _items.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _isGameOver = true;
      });
      widget.studentState.addPoints(_gameScore);
    }
  }

  void _restartGame() {
    setState(() {
      _currentIndex = 0;
      _gameScore = 0;
      _isGameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = _items[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('कचरा वर्गीकरण खेळ 🎮'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: _isGameOver ? _buildGameOverView() : _buildGamePlayView(currentItem),
        ),
      ),
    );
  }

  Widget _buildGamePlayView(WasteItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Score strip
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.accentMint,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'वस्तू ${_currentIndex + 1} / ${_items.length}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryDark),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                gradient: AppTheme.amberGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'खेळ गुण: $_gameScore',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        const Text(
          'खालील कचरा योग्य डब्यात टाका:',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),

        const SizedBox(height: 20),

        // Item Card
        Expanded(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.accentMint,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(item.icon, size: 54, color: AppTheme.primaryGreen),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'हा कचरा ओला आहे की सुका?',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // 2 Dustbin Selection Buttons
        Row(
          children: [
            // Green Bin: ओला कचरा
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () => _handleChoice(true),
                child: const Column(
                  children: [
                    Icon(Icons.delete_rounded, size: 36, color: Colors.white),
                    SizedBox(height: 6),
                    Text(
                      'ओला कचरा',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text('(हिरवा डबा)', style: TextStyle(fontSize: 11, color: Colors.white70)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Blue Bin: सुका कचरा
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0288D1),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () => _handleChoice(false),
                child: const Column(
                  children: [
                    Icon(Icons.delete_sweep_rounded, size: 36, color: Colors.white),
                    SizedBox(height: 6),
                    Text(
                      'सुका कचरा',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text('(निळा डबा)', style: TextStyle(fontSize: 11, color: Colors.white70)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGameOverView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppTheme.amberGradient,
            ),
            child: const Center(
              child: Icon(Icons.stars_rounded, size: 60, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'खेळ समाप्त! 🌟',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppTheme.textDark),
          ),
          const SizedBox(height: 8),
          Text(
            'तुम्ही मिळवलेले गुण: $_gameScore पॉइन्ट्स',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen),
          ),
          const SizedBox(height: 24),
          EcoPrimaryButton(
            label: 'पुन्हा खेळा (Play Again)',
            icon: Icons.replay_rounded,
            onPressed: _restartGame,
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('दालनात परत जा', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
