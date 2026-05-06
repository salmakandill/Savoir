import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/home/presentation/cubit/category_cubit.dart';
import 'package:savoir/features/home/presentation/cubit/category_states.dart';
import 'package:savoir/features/home/presentation/cubit/details_genres_cubit.dart';
import 'package:savoir/features/home/presentation/screens/generes_details_screen.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
                color: AppColors.iconsColor,
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
              color: AppColors.iconsColor,
            ),
          ],
          title: Text(
            'Savoir',
            style: TextStyle(
              color: AppColors.iconsColor,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: AppColors.iconsColor,
                        size: 30,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search genres...',
                    focusColor: const Color(0xffF9DEC3),
                    hintStyle: const TextStyle(color: Color(0xff6B7280)),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.tune,
                        color: AppColors.iconsColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Genres',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.frsittextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.cardsBackground,
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<HomeGenresCubit, HomeGenresStates>(
                  builder: (context, state) {
                    if (state is HomeGenresSuccessState) {
                      return SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 160,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/classics.png',
                                      width: 150,
                                      height: 200,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(
                                                Icons.broken_image,
                                                size: 35,
                                              ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Classics',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.frsittextColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is HomeGenresLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeGenresFailureState) {
                      return Center(child: Text(state.errorMessage));
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 35),
                Text(
                  'Browse by Category',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: AppColors.frsittextColor,
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<HomeGenresCubit, HomeGenresStates>(
                  builder: (context, state) {
                    if (state is HomeGenresSuccessState) {
                      return GridView.builder(
                        itemCount: state.allGenres.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              log('Tapped on genre: ${state.allGenres[index]}');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => CategoryBooksCubit()
                                      ..getCategoryList(
                                        category: state.allGenres[index],
                                      ),

                                    child: GeneresDetailesscreen(
                                      title: state.allGenres[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffEBE4DB),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_stories_outlined,
                                    color: AppColors.cardsBackground,
                                    size: 35,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    state.allGenres[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.iconsColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is HomeGenresLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeGenresFailureState) {
                      return Center(child: Text(state.errorMessage));
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 55),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffEBE4DB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/QuoteSection.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 55),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
