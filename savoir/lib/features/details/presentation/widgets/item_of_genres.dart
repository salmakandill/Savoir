import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class ItemOfGenreswidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ItemOfGenreswidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.cardsBackground
            : AppColors.containercolor2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Literary Fiction',
        style: TextStyle(
          color: isSelected ? AppColors.background : AppColors.containercolor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
