import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/shadow.png', width: 400, height: 400),
            Image.asset(
              'assets/images/borderwithshadow.png',
              width: 350,
              height: 380,
            ),
          ],
        ),
        Text(
          'Discover Your Next Story',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColors.frsittextColor,
          ),
        ),
        Text(
          'Uncover hidden literary gems and timeless classics curated specifically for your unique taste.',
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
