import 'package:flutter/material.dart';
import 'package:savoir/features/home/presentation/screens/home_screen.dart';
import 'package:savoir/features/home/presentation/screens/genres_screen.dart';
import 'package:savoir/features/search/presentation/screens/search_screen.dart';
import 'package:savoir/features/profile/presentation/screens/profile_screen.dart';
import 'package:savoir/models/app_colors.dart';

class CustomBouttomNavBar extends StatefulWidget {
  const CustomBouttomNavBar({super.key});

  @override
  State<CustomBouttomNavBar> createState() => _CustomBouttomNavBarState();
}

class _CustomBouttomNavBarState extends State<CustomBouttomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    GenresScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: 'LIBRARY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'DISCOVER',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
          ),
        ],
        selectedItemColor: AppColors.iconsColor,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
      ),
    );
  }
}
