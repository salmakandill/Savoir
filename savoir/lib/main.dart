import 'package:flutter/material.dart';
import 'views/onboarding_view.dart';

void main() {
  runApp(const SavoirApp());
}

class SavoirApp extends StatelessWidget {
  const SavoirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savoir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        scaffoldBackgroundColor: const Color(0xFFF5F0E8),
      ),
      home: const OnboardingView(),
    );
  }
}
