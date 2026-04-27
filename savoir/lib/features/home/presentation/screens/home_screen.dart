import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.cardsBackground),
        ),
        title: Text(
          'Savoir',
          style: TextStyle(
            color: AppColors.cardsBackground,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none, color: AppColors.cardsBackground),
        ],
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
