import 'package:flutter/material.dart';
import 'package:savoir/features/reading/presentation/screens/reading_list.dart';
import 'package:savoir/features/reading/presentation/widgets/custom_drawer_list_taile.dart';
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.account_circle,
                          color: AppColors.firsttextColor,
                        ),
                        iconSize: 35,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome, Reader!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.firsttextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  ' Explore',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.firsttextColor,
                  ),
                ),
                CustomDrawerListTaile(
                  title: 'Library',
                  icon: Icons.local_library_outlined,
                  onTap: () {},
                ),
                CustomDrawerListTaile(
                  title: 'Categories',
                  icon: Icons.category_outlined,
                  onTap: () {},
                ),
                Divider(),
                SizedBox(height: 14),
                Text(
                  ' Personal',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.firsttextColor,
                  ),
                ),
                CustomDrawerListTaile(
                  title: 'Download',
                  icon: Icons.cloud_download_outlined,
                  onTap: () {},
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
                  onTap: () {},
                ),
                CustomDrawerListTaile(
                  title: 'Reading History',
                  icon: Icons.history,
                  onTap: () {},
                ),
                SizedBox(height: 150),
                CustomDrawerListTaile(
                  title: 'Dark & Light Mood',
                  icon: Icons.light_mode_outlined,
                  onTap: () {},
                ),
                CustomDrawerListTaile(
                  title: 'Settings',
                  icon: Icons.settings,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
