import 'package:flutter/material.dart';
import 'package:savoir/features/home/presentation/screens/genres_screen.dart';
import 'package:savoir/features/home/presentation/screens/home_screen.dart';
import 'package:savoir/features/profile/presentation/screens/profile_screen.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/screens/reading_list.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer_list_taile.dart';

import 'package:savoir/models/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/drawer1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.brown,
                          size: 45,
                        ),
                        iconSize: 35,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome, Reader!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.frsittextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  ' Explore',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.frsittextColor,
                  ),
                ),
                CustomDrawerListTaile(
                  title: 'Library',
                  icon: Icons.local_library_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                CustomDrawerListTaile(
                  title: 'Categories',
                  icon: Icons.category_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenresScreen()),
                    );
                  },
                ),
                Divider(),
                SizedBox(height: 14),
                Text(
                  ' Personal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.frsittextColor,
                  ),
                ),
                CustomDrawerListTaile(
                  title: 'Download',
                  icon: Icons.cloud_download_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadingList()),
                    );
                  },
                ),
                CustomDrawerListTaile(
                  title: 'My List',
                  icon: Icons.bookmark_border,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadingList()),
                    );
                  },
                ),
                CustomDrawerListTaile(
                  title: 'Favorites',
                  icon: Icons.favorite_border,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadingList()),
                    );
                  },
                ),
                CustomDrawerListTaile(
                  title: 'Reading History',
                  icon: Icons.history,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReadingList()),
                    );
                  },
                ),

                Divider(),
                SizedBox(height: 10),
                Text(
                  ' Others',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.frsittextColor,
                  ),
                ),
                CustomDrawerListTaile(
                  title: 'Dark & Light Mood',
                  icon: Icons.light_mode_outlined,
                  onTap: () {},
                ),
                CustomDrawerListTaile(
                  title: 'Settings',
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
