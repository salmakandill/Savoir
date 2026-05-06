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
                Text(
                  'Popular Genres',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.frsittextColor,
                  ),
                ),

                BlocBuilder<HomeGenresCubit, HomeGenresStates>(
                  builder: (context, state) {
                    if (state is HomeGenresSuccessState) {
                      final genres = state.allGenres;
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: genres.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 160,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color.fromARGB(255, 192, 129, 90),
                                      const Color.fromARGB(
                                        255,
                                        99,
                                        64,
                                        43,
                                      ).withOpacity(0.7),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      genres[index][0].toUpperCase() +
                                          genres[index].substring(1),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
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
                                    create: (context) => CategoryBooksCubit(),
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
