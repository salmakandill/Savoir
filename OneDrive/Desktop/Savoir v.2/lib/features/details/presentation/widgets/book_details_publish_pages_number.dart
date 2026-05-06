import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class BookDetailsPublishPagesNumberwidget extends StatelessWidget {
  const BookDetailsPublishPagesNumberwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.containercolor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Published',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.thirdTextColor,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Vintage Classics Publishing',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 16),
          Divider(color: AppColors.frsittextColor, thickness: 1, height: 30),
          SizedBox(width: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number of Pages',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.thirdTextColor,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Vintage Classics Publishing',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
