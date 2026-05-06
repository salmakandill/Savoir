import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class CustomChoicecip extends StatelessWidget {
  const CustomChoicecip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  });
  final bool isSelected;
  final String title;
  final void Function(bool) onSelected;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      showCheckmark: false,
      label: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: isSelected ? Colors.white : AppColors.cardsBackground,
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: AppColors.cardsBackground,
      backgroundColor: Colors.white,
    );
  }
}
