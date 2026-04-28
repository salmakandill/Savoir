import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savoir/features/authontication/widget/appbar.dart';

import 'package:savoir/models/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.background,
     appBar:customeAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon circle
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.appbarcolor,
                
                boxShadow:[ BoxShadow(color: AppColors.appbartextcolor,blurRadius: 10,offset: Offset(0, 5))]
              ),
              child: const Icon(
                Icons.lock_reset,
                color:AppColors.firsttextColor,
                size: 40,
              ),
            ),

            const SizedBox(height: 30),

            // Title
             Text(
              "Forgot Password?",
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.secondTextColor,
              ),
            ),

            const SizedBox(height: 10),

            // Subtitle
            const Text(
              "No worries, it happens. Enter your email and we’ll send you a link to reset it.",
              textAlign: TextAlign.center,
              style: TextStyle(color:AppColors.secondTextColor),
            ),

            const SizedBox(height: 30),

            // Email field
            TextField(
              decoration: InputDecoration(
                hintText: "your@email.com",
                prefixIcon: const Icon(Icons.email),
                filled: true,
                fillColor: AppColors.appbarcolor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cardsBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Send Reset Link",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Back to login
            TextButton(
              onPressed: () {},
              child: const Text(
                "< Back to Login",
                style: TextStyle(color:AppColors.secondTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}