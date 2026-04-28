import 'package:flutter/material.dart';

class Screen3ViewModel extends ChangeNotifier {
  void onContinueJourney(BuildContext context) {
    // هنا هتروح للـ Home Screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Welcome to Savoir! 🎉'),
        backgroundColor: Color(0xFF6B5E42),
      ),
    );
  }

  void onSkip(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Skipped!'),
        backgroundColor: Color(0xFF6B5E42),
      ),
    );
  }
}
