import 'package:flutter/material.dart';
import 'package:savoir/features/home/data/models/books_model.dart';
import 'package:savoir/features/home/presentation/Screens/genres_screen.dart';
import 'package:savoir/features/home/presentation/Screens/home_screen.dart';
import 'package:savoir/features/profile/presentation/screens/profile_screen.dart';
import 'package:savoir/features/home/presentation/Screens/search_screen.dart';
import 'package:savoir/models/app_colors.dart';

class CustomBouttomNavBar extends StatefulWidget {
  final BooksModel? booksModel;

  const CustomBouttomNavBar({super.key, this.booksModel});

  @override
  State<CustomBouttomNavBar> createState() => _CustomBouttomNavBarState();
}

class _CustomBouttomNavBarState extends State<CustomBouttomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    GenresScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onTap(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.iconsColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.local_library_outlined),
            ),
            label: 'LIBRARY',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.menu_book_sharp),
            ),
            label: 'DISCOVER',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.search),
            ),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.person_outline),
            ),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
