import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/login_screen.dart';
import 'package:savoir/features/reading_fatures/presentation/widgets/custom_choicecip.dart';
import 'package:savoir/models/app_colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: AppColors.cardsBackground,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .snapshots(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var userData = asyncSnapshot.data!.data() as Map<String, dynamic>;
          String userName = userData['name'] ?? "User";
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          'assets/images/taylorswift.jfif',
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            userName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cardsBackground,
                            ),
                          ),
                          Text(
                            "Avid Reader • 42 books this year",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.frsittextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 34),
                // Account
                Text(
                  "Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.cardsBackground,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: AppColors.cardsBackground,
                  ),
                  title: Text(
                    "Email Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  subtitle: Text(userData['email'] ?? "No email found"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: AppColors.cardsBackground),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();

                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_none_outlined,
                    color: AppColors.cardsBackground,
                  ),
                  title: Text(
                    "Notification Preferences",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),

                SizedBox(height: 50),

                // Reading Experience
                Text(
                  "Reading Experience",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.cardsBackground,
                  ),
                ),
                SizedBox(height: 30),
                SwitchListTile(
                  secondary: Icon(
                    Icons.wb_sunny_outlined,
                    color: AppColors.cardsBackground,
                  ),
                  title: Text(
                    "Candlelight Mode",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  subtitle: Text(
                    "Warm light for eye comfort",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  value: true,
                  activeColor: AppColors.cardsBackground,
                  onChanged: (val) {},
                ),
                SizedBox(height: 10),
                // Text Size
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.text_fields,
                            color: AppColors.cardsBackground,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Text Size",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.frsittextColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Large",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cardsBackground,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: 0.7,
                        activeColor: AppColors.cardsBackground,
                        inactiveColor: Colors.brown[100],
                        onChanged: (val) {},
                      ),
                    ],
                  ),
                ),

                // Line Spacing
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.format_line_spacing,
                            color: AppColors.cardsBackground,
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Line Spacing",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.frsittextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CustomChoicecip(
                            title: 'Comfort',
                            isSelected: true,
                            onSelected: (bool p1) {},
                          ),
                          SizedBox(width: 8),
                          CustomChoicecip(
                            title: 'Compact',
                            isSelected: false,
                            onSelected: (bool p1) {},
                          ),
                          SizedBox(width: 8),
                          CustomChoicecip(
                            title: 'wide',
                            isSelected: false,
                            onSelected: (bool p1) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 55),

                // General
                Text(
                  "General",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColors.cardsBackground,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.description_outlined,
                    color: AppColors.cardsBackground,
                  ),
                  title: Text(
                    "Privacy & Policy",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: AppColors.cardsBackground,
                  ),
                  title: Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
                ListTile(
                  leading: Icon(
                    Icons.mail_outline,
                    color: AppColors.cardsBackground,
                  ),
                  title: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),

                SizedBox(height: 20),

                Center(
                  child: Text(
                    "Savoir v2.4.0 • Made for Slow Reading",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
