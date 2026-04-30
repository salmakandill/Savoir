import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/redinggirl.png',
                width: 260,
                height: 340,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Read Anywhere, Anytime',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.frsittextColor,
          ),
        ),
        SizedBox(height: 20),
        Text(
          '''Your entire library fits in your pocket. Sync
          your progress across devices and dive back
          into your stories whenever inspiration strikes.''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.frsittextColor,
          ),
        ),
      ],
    );
  }
}
