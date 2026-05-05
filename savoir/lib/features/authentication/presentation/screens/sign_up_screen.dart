import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/login_screen.dart';
import 'package:savoir/features/authentication/presentation/widgets/label_of_text_feild.dart';
import 'package:savoir/features/authentication/presentation/widgets/text_feild.dart';
import 'package:savoir/features/home/presentation/screens/home_screen.dart';
import 'package:savoir/features/home/presentation/widgets/custom_bouttom_navbar.dart';
import 'package:savoir/models/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "Savoir",
                style: TextStyle(
                  color: AppColors.frsittextColor,
                  fontSize: 37,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Begin your literary journey in peace.",
                style: TextStyle(fontSize: 16, color: AppColors.frsittextColor),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFFF5EEDC), Color(0xFFD2B48C)],
                  ),
                  color: AppColors.containercolor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelOfTextFeildwidget(label: "Name"),
                    SizedBox(height: 8),
                    TextFeildwidget(label: "name", controller: nameController),
                    SizedBox(height: 20),

                    LabelOfTextFeildwidget(label: "Email"),
                    SizedBox(height: 8),
                    TextFeildwidget(
                      label: "reader@cafe.com",
                      controller: emailController,
                    ),
                    SizedBox(height: 20),

                    LabelOfTextFeildwidget(label: "Password"),
                    SizedBox(height: 8),
                    TextFeildwidget(
                      label: "••••••••",
                      controller: passwordController,
                    ),
                    SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                            String uid = userCredential.user!.uid;

                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(uid)
                                .set({
                                  'uid': uid,
                                  'name': nameController.text.trim(),
                                  'email': emailController.text.trim(),
                                  'createdAt': DateTime.now(),
                                });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Account created successfully! Please Sign In.",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomBouttomNavBar(),
                              ),
                              (route) => false,
                            );
                          } on FirebaseAuthException catch (e) {
                            String errorMessage = "An error occurred";
                            if (e.code == 'email-already-in-use') {
                              errorMessage =
                                  "This email is already registered.";
                            } else if (e.code == 'weak-password') {
                              errorMessage = "The password is too weak.";
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(errorMessage),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.frsittextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Divider(color: Colors.grey, thickness: 0.2),
                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xFF6B4226),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
