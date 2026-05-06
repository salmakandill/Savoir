import 'package:flutter/material.dart';
import 'package:savoir/features/home/presentation/widgets/custom_history_container.dart';
import 'package:savoir/features/home/presentation/widgets/custom_suggiction_container.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: AppColors.cardsBackground,
                      size: 30,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search book',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Recent searches",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 10),
              CustomHistoryContainer(title: 'Classic Literature'),
              SizedBox(height: 10),
              Row(
                children: [
                  CustomHistoryContainer(title: 'Space Exploration'),
                  SizedBox(width: 8),
                  CustomHistoryContainer(title: 'Poetry'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Suggested books",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              CustomSuggictionContainer(),
              SizedBox(height: 10),
              CustomSuggictionContainer(),
              SizedBox(height: 10),
              CustomSuggictionContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
