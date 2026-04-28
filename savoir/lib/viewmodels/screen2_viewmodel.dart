import 'package:flutter/material.dart';
import '../views/screen3_view.dart';

class Screen2ViewModel extends ChangeNotifier {
  void onNextStep(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Screen3View()),
    );
  }

  void onSkip(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Screen3View()),
    );
  }
}
