import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class TextFeildofforgetpasseordwidget extends StatelessWidget {
  const TextFeildofforgetpasseordwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.containercolor.withOpacity(0.1),
        prefixIcon: const Icon(
          Icons.mail_outline,
          color: AppColors.thirdTextColor,
        ),

        hintText: 'your@email.com',
        hintStyle: const TextStyle(
          color: AppColors.thirdTextColor,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.thirdTextColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.frsittextColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
