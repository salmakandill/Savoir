import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class TextFeildpasswordwidget extends StatelessWidget {
  const TextFeildpasswordwidget({
    super.key,
    required this.icon,
    required this.hintText,
  });
  final IconData icon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.containercolor.withOpacity(0.1),
        prefixIcon: Icon(icon, color: AppColors.cardsBackground),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.cardsBackground,
          fontSize: 16,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.cardsBackground,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
