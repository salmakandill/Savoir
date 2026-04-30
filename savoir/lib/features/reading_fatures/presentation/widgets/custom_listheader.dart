import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class CustomListheader extends StatelessWidget {
  const CustomListheader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitleColor,
  });
  final String title, subtitle;
  final Color subtitleColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.cardsBackground,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
}
