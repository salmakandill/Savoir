import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/data/models/also_liked_books_model.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/also_like_cubit.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/details_cubit.dart';
import 'package:savoir/features/details/presentation/screens/details_screen.dart';
import 'package:savoir/models/app_colors.dart';

class BuildCardOfRecommendedForYouwidget extends StatelessWidget {
  BuildCardOfRecommendedForYouwidget({super.key, this.book});
  final BookDetailsModel? book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("Book ID: ${book?.id}");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      DetailsCubit()..getBookDetails(id: book!.id),
                ),
                BlocProvider(
                  create: (context) =>
                      AlsoLikeCubit()..getSimilarBooks(id: book!.id),
                ),
              ],
              child: DetailsScreen(),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                      Image.network(
                      book?.image??'',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.broken_image, size: 35),
                        );
                      },
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.bookmark_border,
                          size: 18,
                          color: AppColors.cardsBackground,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              book?.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.frsittextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
              ),
            ),

            SizedBox(height: 4),
            Text(
              book?.authorname ?? "",
              style: TextStyle(color: AppColors.thirdTextColor, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
