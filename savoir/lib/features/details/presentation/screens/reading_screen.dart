import 'package:flutter/material.dart';
import 'package:savoir/features/details/presentation/widgets/reading_settings_sheet.dart';
import 'package:savoir/models/app_colors.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppColors.cardsBackground),
          ),
        ),

        title: Text(
          'The Alchemist',
          style: TextStyle(
            color: AppColors.textColor4,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.format_size, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.contrast, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'CHAPTER IV',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor4,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "The Desert's Whisper",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor4,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          "Everything is one, the alchemist had toldhim. He repeated those words like amantra, trying to understand how theshifting sands beneath his feet wereconnected to the stars that would soonemerge in the velvet sky. He reached intohis pocket and felt the cool surface ofUrim and Thummim, the stones that hadguided him this far.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor4,
                          ),
                        ),
                        Text(
                          "Everything is one, the alchemist had toldhim. He repeated those words like amantra, trying to understand how theshifting sands beneath his feet wereconnected to the stars that would soonemerge in the velvet sky. He reached intohis pocket and felt the cool surface ofUrim and Thummim, the stones that hadguided him this far.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textcolor,
                          ),
                        ),
                        Text(
                          "Everything is one, the alchemist had toldhim. He repeated those words like amantra, trying to understand how theshifting sands beneath his feet wereconnected to the stars that would soonemerge in the velvet sky. He reached intohis pocket and felt the cool surface ofUrim and Thummim, the stones that hadguided him this far.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textcolor,
                          ),
                        ),
                        Text(
                          "Everything is one, the alchemist had toldhim. He repeated those words like amantra, trying to understand how theshifting sands beneath his feet wereconnected to the stars that would soonemerge in the velvet sky. He reached intohis pocket and felt the cool surface ofUrim and Thummim, the stones that hadguided him this far.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textcolor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ReadingSettingsSheet(),
          ],
        ),
      ),
    );
  }
}
