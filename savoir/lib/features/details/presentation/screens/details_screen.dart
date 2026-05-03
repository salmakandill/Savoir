import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/data/models/also_liked_books_model.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/also_like_cubit.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/also_like_cubit_status.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/book_details_cubit_status.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/details_cubit.dart';
import 'package:savoir/features/details/presentation/widgets/book_details.dart';
import 'package:savoir/features/details/presentation/widgets/book_details_publish_pages_number.dart';
import 'package:savoir/features/details/presentation/widgets/build_book_header_of_details.dart';
import 'package:savoir/features/details/presentation/widgets/item_of_genres.dart';
import 'package:savoir/features/home/presentation/widgets/build_card_of_recommended_for_you.dart';
import 'package:savoir/models/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, this.book, this.likedBooks});
  final BookDetailsModel? book;
  final AlsoLikedBooksModel? likedBooks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.cardsBackground),
        ),

        title: Text(
          'Savoir',
          style: TextStyle(
            color: AppColors.cardsBackground,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.share, color: AppColors.cardsBackground),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<DetailsCubit, DetailsStates>(
                builder: (context, state) {
                  if (state is DetailsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is DetailsSuccessState) {
                    return Column(
                      children: [
                        BuildBookHeaderOfDetailswidget(book: state.book),
                        SizedBox(height: 48),
                        BookDetailswidget(book: state.book),
                      ],
                    );
                  } else if (state is DetailsFailureState) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),

              SizedBox(height: 48),
              Text(
                'Synopsis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              BlocBuilder<DetailsCubit, DetailsStates>(
                builder: (context, state) {
                  if (state is DetailsLoadingState) {
                    return SizedBox();
                  } else if (state is DetailsSuccessState) {
                    return Text(
                      state.book.description ?? "No description available.",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor4,
                      ),
                    );
                  } else if (state is DetailsFailureState) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),

              SizedBox(height: 16),
              // SizedBox(
              //   height: 40,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 10,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ItemOfGenreswidget(
              //         title: 'Literary Fiction',
              //         isSelected: index == 0,
              //         onTap: () {},
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: 48),
              Text(
                'Book Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              BlocBuilder<DetailsCubit, DetailsStates>(
                builder: (context, state) {
                  if (state is DetailsSuccessState) {
                    return BookDetailsPublishPagesNumberwidget();
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Readers also liked',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: AppColors.cardsBackground),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              BlocBuilder<AlsoLikeCubit, SimilarBooksState>(
                builder: (context, state) {
                  if (state is SimilarLoadingBooks) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SimilarSuccessBooks) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.55,
                      ),
                      itemCount: state.books.length,
                      itemBuilder: (context, index) =>
                          BuildCardOfRecommendedForYouwidget(
                            likedBooks: state.books[index],
                          ),
                    );
                  } else if (state is SimilarFailureBooks) {
                    return Center(child: Text(state.errMessage));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.cardsBackground,
        elevation: 4,
        shape: CircleBorder(),
        child: Icon(Icons.bookmark, color: Colors.white, size: 28),
      ),
    );
  }
}
