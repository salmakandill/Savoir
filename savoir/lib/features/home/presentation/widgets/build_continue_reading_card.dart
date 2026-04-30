import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class BuildContinueReadingCardwidget extends StatelessWidget {
  const BuildContinueReadingCardwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.containercolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/images/Reading Book.png",
              width: 70,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Meditations",
                  style: TextStyle(
                    color: AppColors.frsittextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Serif',
                  ),
                ),
                Text(
                  "Marcus Aurelius",
                  style: TextStyle(color: AppColors.thirdTextColor, fontSize: 14),
                ),
                SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.64,
                    backgroundColor: AppColors.background,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.cardsBackground,
                    ),
                    minHeight: 6,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Page 124 of 192",
                      style: TextStyle(
                        color: AppColors.thirdTextColor,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      "64%",
                      style: TextStyle(
                        color: AppColors.thirdTextColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
