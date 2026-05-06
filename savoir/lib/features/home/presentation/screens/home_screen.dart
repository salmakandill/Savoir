import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/home/presentation/cubit/category_cubit.dart';
import 'package:savoir/features/home/presentation/cubit/category_states.dart';
import 'package:savoir/features/home/presentation/cubit/details_genres_cubit.dart';
import 'package:savoir/features/home/presentation/cubit/home_recommended_cubit.dart';
import 'package:savoir/features/home/presentation/cubit/home_states_recommended.dart';
import 'package:savoir/features/home/presentation/screens/generes_details_screen.dart';
import 'package:savoir/features/home/presentation/widgets/build_card.dart';
import 'package:savoir/features/home/presentation/widgets/genres_item.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';

import '../widgets/build_card_of_recommended_for_you.dart';
import '../widgets/build_continue_reading_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedGenreIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
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
            child: Icon(
              Icons.notifications_none,
              color: AppColors.cardsBackground,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => const BuildCardwidget(),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Explore Genres',
                style: TextStyle(color: AppColors.textColor4, fontSize: 24),
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeGenresCubit, HomeGenresStates>(
                builder: (context, state) {
                  if (state is HomeGenresSuccessState) {
                    final genres = state.allGenres;

                    return SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: genres.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GenresItemwidget(
                            title:
                                genres[index][0].toUpperCase() +
                                genres[index].substring(1),
                            isSelected: selectedGenreIndex == index,
                            onTap: () {
                              setState(() {
                                selectedGenreIndex = index;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => CategoryBooksCubit(),
                                    child: GeneresDetailesscreen(
                                      title: genres[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else if (state is HomeGenresLoadingState) {
                    return const SizedBox(
                      height: 40,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  } else if (state is HomeGenresFailureState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Continue Reading',
                    style: TextStyle(color: AppColors.textColor4, fontSize: 24),
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
              const BuildContinueReadingCardwidget(),
              const SizedBox(height: 40),
              Text(
                "Recommended for You",
                style: TextStyle(
                  color: AppColors.textColor4,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeSuccessState) {
                    final booksList = state.books;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.55,
                          ),
                      itemCount: booksList.length,
                      itemBuilder: (context, index) =>
                          BuildCardOfRecommendedForYouwidget(
                            book: booksList[index],
                          ),
                    );
                  } else if (state is HomeFailureState) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
