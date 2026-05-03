import 'package:flutter/material.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';
import 'package:savoir/models/app_colors.dart';

class BookDetailswidget extends StatelessWidget {
  const BookDetailswidget({super.key, required this.book});
  final BookDetailsModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.containercolor3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          buildInfoItem("pages", book.pages ?? "Unknown"),
          buildDivider(),
          buildInfoItem("Language", book.language ?? "Unknown"),
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
