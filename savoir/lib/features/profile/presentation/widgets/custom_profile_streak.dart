import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class CustomProfileStreak extends StatelessWidget {
  const CustomProfileStreak({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.containercolor2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                color: AppColors.cardsBackground,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
