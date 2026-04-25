import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:savoir/features/home/presentation/Screens/genresScreen.dart';
import 'package:savoir/features/home/presentation/Screens/homescreen.dart';
import 'package:savoir/features/home/presentation/Screens/profileScreen.dart';
import 'package:savoir/features/home/presentation/Screens/searchScreen.dart';
import 'package:savoir/models/app_colors.dart';

class Custombouttomnavbar extends StatelessWidget {
  const Custombouttomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            iconSize: 40,
            title: 'LIBRARY',
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            activeForegroundColor: AppColors.iconsColor,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: GenresScreen(),
          item: ItemConfig(
            icon: Icon(Icons.menu_book_rounded),
            iconSize: 40,
            title: 'DISCOVER',
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            activeForegroundColor: AppColors.iconsColor,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: SearchScreen(),
          item: ItemConfig(
            icon: Icon(Icons.search),
            iconSize: 40,
            title: 'SEARCH',
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            activeForegroundColor: AppColors.iconsColor,
            inactiveForegroundColor: Colors.grey,
          ),
        ),
        PersistentTabConfig(
          screen: Profilescreen(),
          item: ItemConfig(
            icon: Icon(Icons.person),
            iconSize: 40,
            title: 'PROFILE',
            textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
