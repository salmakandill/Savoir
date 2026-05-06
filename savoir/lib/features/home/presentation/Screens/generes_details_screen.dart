import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';
import 'package:savoir/features/home/data/models/books_model.dart';
import 'package:savoir/features/home/presentation/cubit/category_states.dart';
import 'package:savoir/features/home/presentation/cubit/details_genres_cubit.dart';
import 'package:savoir/features/home/presentation/cubit/home_recommended_cubit.dart';
import 'package:savoir/features/home/presentation/cubit/home_states_recommended.dart';
import 'package:savoir/features/home/presentation/widgets/build_card_of_recommended_for_you.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';

class GeneresDetailesscreen extends StatelessWidget {
  final String title;

  const GeneresDetailesscreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        drawer: CustomDrawer(),
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
            title,
            style: TextStyle(
              color: AppColors.iconsColor,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),

        body: BlocBuilder<CategoryBooksCubit, HomeGenresStates>(
          builder: (context, state) {
            if (state is HomeGenresInitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeGenresFailureState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is CategoryBooksSuccessState) {
              final books = state.books;
              return SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BuildCardOfRecommendedForYouwidget(
                      book: books[index],
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
