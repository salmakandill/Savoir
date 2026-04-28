import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF5F0E8);
  static const Color surface = Color(0xFFEDE8DE);
  static const Color primary = Color(0xFF6B5E42);
  static const Color primaryDark = Color(0xFF4A3F2E);
  static const Color accent = Color(0xFFC4A882);
  static const Color textPrimary = Color(0xFF2C2416);
  static const Color textSecondary = Color(0xFF8C7B65);
  static const Color cardBeige = Color(0xFFE8DFD0);
  static const Color dotInactive = Color(0xFFD4C9B5);
  static const Color dotActive = Color(0xFF6B5E42);
  static const Color iconCircle = Color(0xFFF0E8D8);
  static const Color white = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static const TextStyle logo = TextStyle(
    fontFamily: 'Georgia',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 4,
    color: AppColors.textPrimary,
  );
  static const TextStyle skip = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: AppColors.textSecondary,
  );
  static const TextStyle headline = TextStyle(
    fontFamily: 'Georgia',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: AppColors.textPrimary,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );
  static const TextStyle button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.white,
  );
  static const TextStyle signIn = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    color: AppColors.primary,
  );
  static const TextStyle alreadyAccount = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
    color: AppColors.textSecondary,
  );
}
