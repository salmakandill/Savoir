import 'package:flutter/material.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'package:savoir/features/profile/presentation/widgets/custom_profile_streak.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
              color: AppColors.iconsColor,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
            icon: Icon(Icons.settings),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/taylorswift.jfif'),
            ),
            SizedBox(height: 10),
            Text(
              "Taylor Swift",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Lover of classics and historical fiction",
              style: TextStyle(
                color: AppColors.greyText,
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 20),
            CustomProfileStreak(title: 'BOOKS READ', value: '24'),
            SizedBox(height: 20),
            CustomProfileStreak(title: 'DAY STREAK', value: '12'),
            SizedBox(height: 20),
            CustomProfileStreak(title: 'HOURS SPENT', value: '156'),

            SizedBox(height: 35),

            ListTile(
              leading: Icon(
                Icons.rate_review_outlined,
                color: AppColors.cardsBackground,
              ),
              title: Text(
                "My Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.favorite_border,
                color: AppColors.cardsBackground,
              ),
              title: Text(
                "Favorite Authors",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.emoji_events_outlined,
                color: AppColors.cardsBackground,
              ),
              title: Text(
                "Achievements",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),

            SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ambient Warmth",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Slider(
                        value: 0.5,
                        onChanged: (val) {},
                        activeColor: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.nightlight_round, color: Colors.brown),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
