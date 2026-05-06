import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class BookDetailswidget extends StatelessWidget {
  const BookDetailswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containercolor3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          buildInfoItem("pages", " 435"),
          buildDivider(),
          buildInfoItem("Language", "English"),
          buildDivider(),
          buildInfoItem("Audio", "12h 4m"),
        ],
      ),
    );
  }
}

Widget buildInfoItem(String title, String value) {
  return Expanded(
    child: Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.cardsBackground,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget buildDivider() {
  return Container(height: 30, width: 1, color: AppColors.thirdTextColor);
}
