import 'package:flutter/material.dart';
import 'package:savoir/features/reading/presentation/widgets/custom_drawer_list_taile.dart';
import 'package:savoir/models/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
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
            ' EXPLORE',
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
            ' Downloads',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.firsttextColor,
            ),
          ),

          CustomDrawerListTaile(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
