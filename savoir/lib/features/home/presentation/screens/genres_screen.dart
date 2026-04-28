import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:savoir/features/reading/presentation/widgets/custom_drawer.dart';
import 'package:savoir/models/app_colors.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  State<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  final List<Map<String, dynamic>> items = [
    {'title': 'Fiction', 'icon': Icons.auto_stories_outlined},
    {'title': 'History', 'icon': Icons.castle_outlined},
    {'title': 'Science', 'icon': Icons.biotech_outlined},
    {'title': 'Mystery', 'icon': Icons.fingerprint},
    {'title': 'Biography', 'icon': Icons.badge_outlined},
    {'title': 'Philosophy', 'icon': Icons.psychology_outlined},
    {'title': 'Poetry', 'icon': Icons.edit_outlined},
    {'title': 'Art', 'icon': Icons.palette_outlined},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              onPressed: () {},
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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: AppColors.iconsColor,
                        size: 30,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search genres...',
                    focusColor: Color(0xffF9DEC3),

                    hintStyle: TextStyle(color: Color(0xff6B7280)),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.tune,
                        color: AppColors.iconsColor,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Genres',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.firsttextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.cardsBackground,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                  child: GestureDetector(
                    onTap: () {
                      log('List Tapped');
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 160,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/classics.png',
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(Icons.broken_image, size: 35),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Classics',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.firsttextColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  'Browse by Category',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondTextColor,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    log('Grid Tapped');
                  },
                  child: GridView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xffEBE4DB),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              items[index]['icon'],
                              color: AppColors.cardsBackground,
                              size: 35,
                            ),
                            SizedBox(height: 10),
                            Text(
                              items[index]['title'],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: AppColors.iconsColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 55),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffEBE4DB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/QuoteSection.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 55),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
