import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/also_like_cubit.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/details_cubit.dart';
import 'package:savoir/features/details/presentation/screens/details_screen.dart';
import 'package:savoir/features/details/presentation/screens/reading_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/cubits/history_cubit.dart';
import 'package:savoir/features/reading_fatures/presentation/cubits/history_states.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_listheader.dart';
import 'package:savoir/models/app_colors.dart';

class ReadingHistory extends StatefulWidget {
  const ReadingHistory({super.key});

  @override
  State<ReadingHistory> createState() => _ReadingHistoryState();
}

class _ReadingHistoryState extends State<ReadingHistory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            CustomListheader(
              title: 'Currently Reading',
              subtitle: '3 BOOKS',
              subtitleColor: AppColors.thirdTextColor,
            ),
            SizedBox(height: 12),

            BlocBuilder<HistoryCubit, HistoryStates>(
              builder: (context, state) {
                if (state is LoadingHistoryState) {
                  return SizedBox(
                    height: 310,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is FaluierHistoryState) {
                  return SizedBox(
                    height: 310,
                    child: Center(child: Text(state.message)),
                  );
                } else if (state is SuccessHistoryState) {
                  final books = state.books;

                  return Column(
                    children: [
                      SizedBox(
                        height: 310,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadingScreen(),
                              ),
                            );
                          },
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: books.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 20),
                            itemBuilder: (context, index) {
                              final bookitem = books[index];

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      bookitem.imageUrl,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  SizedBox(
                                    width: 130,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bookitem.title,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.frsittextColor,
                                          ),
                                        ),
                                        Text(
                                          bookitem.author,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.thirdTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 24),
                      CustomListheader(
                        title: 'Reading History',
                        subtitle: 'View All',
                        subtitleColor: AppColors.cardsBackground,
                      ),

                      SizedBox(height: 12),

                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: books.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          final book = books[index];
                          return GestureDetector(
                            onTap: () {
                              context.read<DetailsCubit>().getBookDetails(
                                id: book.id,
                              );
                              context.read<AlsoLikeCubit>().getSimilarBooks(
                                id: book.id,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    book.imageUrl,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                SizedBox(width: 22),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        book.title,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.frsittextColor,
                                        ),
                                      ),
                                      Text(
                                        book.author,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.thirdTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Finished reading days ago',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          color: AppColors.thirdTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }

                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
