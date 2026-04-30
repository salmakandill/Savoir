import 'package:flutter/material.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/screens/download_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/screens/favorites_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/screens/my_list.dart';
import 'package:savoir/features/reading_fatures/presentation/screens/reading_history.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_choicecip.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';

class ReadingList extends StatefulWidget {
  const ReadingList({super.key});

  @override
  State<ReadingList> createState() => _ReadingListState();
}

class _ReadingListState extends State<ReadingList> {
  final List<String> tabTitles = [
    'Reading History',
    'My List',
    'Downloads',
    'Favorites',
  ];
  final List<Widget> pages = [
    ReadingHistory(),
    MyList(),
    DownloadsScreen(),
    FavoritesScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'My List',
          style: TextStyle(
            color: AppColors.cardsBackground,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: tabTitles.length,
                itemBuilder: (context, index) {
                  return Row(
                    spacing: 10,
                    children: [
                      CustomChoicecip(
                        title: tabTitles[index],
                        isSelected: selectedIndex == index,
                        onSelected: (value) {
                          selectedIndex = index;
                          setState(() {});
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            Divider(),
            SizedBox(height: 12),
            Expanded(
              child: IndexedStack(index: selectedIndex, children: pages),
            ),
          ],
        ),
      ),
    );
  }
}
