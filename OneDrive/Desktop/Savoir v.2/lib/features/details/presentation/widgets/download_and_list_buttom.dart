import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class DownloadAndListButtomwidget extends StatelessWidget {
  const DownloadAndListButtomwidget({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20, color: const Color(0xff8D4F1D)),
      label: Text(
        label,
        style: const TextStyle(
          color: Color(0xff8D4F1D),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.containercolor,
        elevation: 0,
        side: BorderSide(color: Colors.grey.shade300),
        minimumSize: const Size(0, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
