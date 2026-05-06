import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:savoir/features/authentication/presentation/widgets/otp_container.dart';
import 'package:savoir/features/authentication/presentation/widgets/otp_widgets.dart';
import 'package:savoir/models/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController c1 = TextEditingController();
  final TextEditingController c2 = TextEditingController();
  final TextEditingController c3 = TextEditingController();
  final TextEditingController c4 = TextEditingController();
  final TextEditingController c5 = TextEditingController();
  final TextEditingController c6 = TextEditingController();

  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF8F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          size: 25,
          color: AppColors.cardsBackground,
        ),
        title: Text(
          "Savoir",
          style: TextStyle(
            color: AppColors.cardsBackground,
            fontFamily: "Newsreader",
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                radius: 38,
                backgroundColor: Color(0xFFF3E9DD),
                child: Icon(
                  Icons.lock_outline_rounded,
                  size: 38,
                  color: AppColors.cardsBackground,
                ),
              ),
              SizedBox(height: 25),
              Column(
                children: [
                  Text(
                    "Check your mail",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w600,
                      color: AppColors.frsittextColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "We've sent a 6-digit verification code to your registered email address.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.frsittextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OtpBox(controller: c1),
                  OtpBox(controller: c2),
                  OtpBox(controller: c3),
                  OtpBox(controller: c4),
                  OtpBox(controller: c5),
                  OtpBox(controller: c6),
                ],
              ),

              SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    String fullCode =
                        c1.text +
                        c2.text +
                        c3.text +
                        c4.text +
                        c5.text +
                        c6.text;
                    if (fullCode == "123456") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Invalid verification code! Please  again.",
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cardsBackground,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Verify Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Newsreader",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(
                      color: AppColors.frsittextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: "Resend code",
                        style: TextStyle(
                          color: AppColors.cardsBackground,
                          fontFamily: "Newsreader",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),

              OtpContainer(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
