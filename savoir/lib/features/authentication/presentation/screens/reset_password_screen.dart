import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/login_screen.dart';
import 'package:savoir/features/authentication/presentation/screens/otp_screen.dart';
import 'package:savoir/features/authentication/presentation/widgets/forget_password_buttom.dart';
import 'package:savoir/features/authentication/presentation/widgets/label_of_text_feild.dart';
import 'package:savoir/features/authentication/presentation/widgets/text_feild_password.dart';
import 'package:savoir/models/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.cardsBackground),
        ),
        title: Text(
          "Savoir",
          style: TextStyle(
            color: AppColors.cardsBackground,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 60),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.containercolor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_reset,
                      size: 40,
                      color: AppColors.cardsBackground,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  "Reset Password",
                  style: TextStyle(
                    color: AppColors.cardsBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Create a new secure password for your reading sanctuary.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textColor4,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 350,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFF5EEDC), Color(0xFFD2B48C)],
                    ),
                    color: AppColors.containercolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      LabelOfTextFeildwidget(label: 'NEW PASSWORD'),
                      SizedBox(height: 8),
                      TextFeildpasswordwidget(
                        controller: newPasswordController,
                        icon: Icons.lock_outline,
                        hintText: 'new password',
                      ),
                      SizedBox(height: 50),
                      LabelOfTextFeildwidget(label: 'CONFIRM PASSWORD'),
                      SizedBox(height: 8),
                      TextFeildpasswordwidget(
                        controller: confirmPasswordController,
                        icon: Icons.lock_outline,
                        hintText: 'confirm password',
                      ),
                      SizedBox(height: 30),
                      ForgetPasswordButtomwidget(
                        lable: 'Reset Password',
                        onPressed: () async {
                          log(newPasswordController.text);
                          if (newPasswordController.text ==
                              confirmPasswordController.text) {
                            try {
                              final user = FirebaseAuth.instance.currentUser;
                              log(  user.toString()); 
                              await FirebaseAuth.instance.currentUser!
                                  .updatePassword(
                                    newPasswordController.text.trim(),
                                  );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Password reset successful! Please log in with your new password.",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("error: ${e.toString()}"),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Passwords do not match! Please try again.",
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Column(
                  children: [
                    Text(
                      '"A room without books is like a body without a soul."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColors.thirdTextColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '— CICERO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.thirdTextColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
