import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:savoir/features/home/data/models/books_model.dart';
import 'package:savoir/features/home/presentation/Screens/genres_screen.dart';
import 'package:savoir/features/home/presentation/Screens/home_screen.dart';
import 'package:savoir/features/home/presentation/cubit/home_recommended_cubit.dart';
import 'package:savoir/features/profile/presentation/screens/profile_screen.dart';
import 'package:savoir/features/home/presentation/Screens/search_screen.dart';
import 'package:savoir/models/app_colors.dart';

class CustomBouttomNavBar extends StatelessWidget {
  CustomBouttomNavBar({super.key, this.booksModel});
  final BooksModel? booksModel;
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: BlocProvider(
            create: (context) => HomeCubit()..getBooks(),
            child: HomeScreen(),
          ),
          item: ItemConfig(
            icon: Icon(Icons.local_library_outlined),
            iconSize: 30,
            title: 'LIBRARY',
            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            activeForegroundColor: AppColors.iconsColor,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: GenresScreen(),
          item: ItemConfig(
            icon: Icon(Icons.menu_book_sharp),
            iconSize: 30,
            title: 'DISCOVER',
            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            activeForegroundColor: AppColors.iconsColor,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: SearchScreen(),
          item: ItemConfig(
            icon: Icon(Icons.search),
            iconSize: 30,
            title: 'SEARCH',
            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            activeForegroundColor: AppColors.iconsColor,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: ProfileScreen(),
          item: ItemConfig(
            icon: Icon(Icons.person_outline),
            iconSize: 30,
            title: 'PROFILE',
            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            activeForegroundColor: AppColors.iconsColor,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
