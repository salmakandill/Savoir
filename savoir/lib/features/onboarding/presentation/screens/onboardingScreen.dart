import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/login_screen.dart';
import 'package:savoir/features/onboarding/presentation/screens/onboarding_page1.dart';
import 'package:savoir/features/onboarding/presentation/screens/onboarding_page2.dart';
import 'package:savoir/features/onboarding/presentation/screens/onboarding_page3.dart';
import 'package:savoir/features/onboarding/presentation/widgets/custom_opening_button.dart';
import 'package:savoir/features/onboarding/presentation/widgets/cutomheader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF3EE),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Cutomheader(),
              SizedBox(
                height: 600,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  children: [
                    OnboardingPage1(),
                    OnboardingPage2(),
                    OnboardingPage3(),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 12,
                  activeDotColor: Colors.brown,
                  dotColor: Colors.grey,
                ),
              ),

              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: CustomOpeningButton(
                  title: currentIndex == 0
                      ? 'Continue Journey'
                      : currentIndex == 1
                      ? 'Next Step'
                      : 'Get Started',
                  onPressed: () {
                    if (currentIndex < 2) {
                      controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
