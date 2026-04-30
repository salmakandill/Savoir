import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/widgets/label_of_text_feild.dart';
import 'package:savoir/features/authentication/presentation/widgets/text_feild.dart';
import 'package:savoir/models/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

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
                    TextFeildwidget(label: "Elias Thorne"),
                    SizedBox(height: 20),

                    LabelOfTextFeildwidget(label: "Email"),
                    SizedBox(height: 8),
                    TextFeildwidget(label: "reader@cafe.com"),
                    SizedBox(height: 20),

                    LabelOfTextFeildwidget(label: "Password"),
                    SizedBox(height: 8),
                    TextFeildwidget(label: "••••••••"),
                    SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
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
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xFF6B4226),
                              fontSize: 18,
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
