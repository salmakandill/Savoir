import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/forget_password_screen.dart';
import 'package:savoir/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:savoir/features/authentication/presentation/widgets/forget_password_buttom.dart';
import 'package:savoir/features/authentication/presentation/widgets/label_of_text_feild.dart';
import 'package:savoir/features/authentication/presentation/widgets/other_way-login.dart';
import 'package:savoir/features/authentication/presentation/widgets/text_feild.dart';
import 'package:savoir/features/home/presentation/widgets/custom_bouttom_navbar.dart';
import 'package:savoir/models/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Savoir",
          style: TextStyle(
            color: Color(0xFF8B4513),
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.containercolor,
                  radius: 40,
                  child: Icon(
                    Icons.auto_stories_outlined,
                    size: 40,
                    color: AppColors.cardsBackground,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textcolor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Continue your literary journey.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFFF5EEDC), Color(0xFFD2B48C)],
                  ),
                  color: AppColors.containercolor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelOfTextFeildwidget(label: "Email Address"),
                    SizedBox(height: 8),
                    TextFeildwidget(label: "reader@example.com"),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelOfTextFeildwidget(label: "Password"),
                        TextButton(
                          onPressed: () {},
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                color: AppColors.cardsBackground,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextFeildwidget(label: "Enter your password"),
                    SizedBox(height: 25),
                    ForgetPasswordButtomwidget(
                      lable: 'Sign in',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomBouttomNavBar(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.frsittextColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR CONTINUE WITH",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.frsittextColor)),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: OtherWayloginwidget(
                        iconPath: 'assets/images/login&signup/google.png',
                        label: 'GOOGLE',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: OtherWayloginwidget(
                        iconPath: 'assets/images/login&signup/ios.png',
                        label: 'APPLE',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: AppColors.cardsBackground,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
