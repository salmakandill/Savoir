import 'package:flutter/material.dart';
import 'package:savoir/features/authontication/prasentation/widgets/otp_widgets.dart';
import 'package:savoir/models/app_colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildHeaderIcon(),
              const SizedBox(height: 25),
              _buildTextHeader(),
              const SizedBox(height: 40),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => const OtpBox()),
              ),
              
              const SizedBox(height: 35),
              _buildVerifyButton(),
              const SizedBox(height: 25),
              _buildResendText(),
              const SizedBox(height: 50),
              
              const SecurityNoticeCard(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.arrow_back_ios_new, size: 20, color:AppColors.background),
      title: const Text(
        "Savoir",
        style: TextStyle(color: AppColors.cardsBackground, fontFamily: "Newsreader", fontSize: 18),
      ),
      centerTitle: true,
    );
  }

  Widget _buildHeaderIcon() {
    return const CircleAvatar(
      radius: 38,
      backgroundColor: Color(0xFFF3E9DD),
      child: Icon(Icons.lock_outline_rounded, size: 38, color: AppColors.cardsBackground),
    );
  }

  Widget _buildTextHeader() {
    return Column(
      children: const [
        Text(
          "Check your mail",
          style: TextStyle(fontSize: 24, fontFamily: "Nesreader", color: AppColors.firsttextColor),
        ),
        SizedBox(height: 12),
        Text(
          "We've sent a 6-digit verification code to your registered email address.",
          textAlign: TextAlign.center,
          style: TextStyle(color:AppColors.secondTextColor, fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildVerifyButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.cardsBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text(
          "Verify Code",
          style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Newsreader"),
        ),
      ),
    );
  }

  Widget _buildResendText() {
    return InkWell(
      onTap: () {},
      child: RichText(
        text: const TextSpan(
          text: "Didn't receive the code? ",
          style: TextStyle(color: AppColors.secondTextColor, fontSize: 14),
          children: [
            TextSpan(
              text: "Resend code",
              style: TextStyle(color: AppColors.cardsBackground, fontFamily: "Newsreader"),
            ),
          ],
        ),
      ),
    );
  }
}