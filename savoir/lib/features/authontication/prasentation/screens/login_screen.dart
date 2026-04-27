import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';
import 'package:savoir/features/authontication/prasentation/widgets/auth_from_container.dart';
import 'package:savoir/features/authontication/prasentation/widgets/custom_button.dart';
import 'package:savoir/features/authontication/prasentation/widgets/custom_text_form_field.dart';
import 'package:savoir/features/authontication/prasentation/widgets/social_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Savoir",
          style: TextStyle(color: AppColors.thirdTextColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
         
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.iconsColor.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/Icon.png",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 32,
                  color: AppColors.secondTextColor,
                  fontFamily: 'Newsreader',
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Continue your literary journey.',
                style: TextStyle(fontSize: 16, fontFamily: 'Newsreader',color: AppColors.thirdTextColor),
              ),

              const SizedBox(height: 40),

              AuthFormContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email Address", style: TextStyle(fontFamily: 'Newsreader',color: AppColors.firsttextColor)),
                    const SizedBox(height: 8),
                    const CustomTextFormField(hintText: 'reader@example.com'),
                    const SizedBox(height: 20),
                    const Text("Password", style: TextStyle(fontFamily: 'Newsreader',color: AppColors.firsttextColor)),
                    const SizedBox(height: 8),
                    const CustomTextFormField(
                      hintText: '********',
                      isObscureText: true,
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => print("Forgot Password clicked"),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: AppColors.iconsColor,
                            fontFamily:'Newsreader' ,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      buttonText: "SIGN IN",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1, color: Color(0xFFD7CCC8))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR CONTINUE WITH",
                        style: TextStyle(
                          fontSize: 12,
                        fontFamily: "Newsreader",
                          color: AppColors.thirdTextColor,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(thickness: 1, color: Color(0xFFD7CCC8))),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(child: 
                
                    SocialButton(
                      label: "Google",
                      iconPath: "assets/images/google.png",
                      onTap: () => print("Google Login"),
                    )),
                     SizedBox(width: 15),
                     Expanded(child:
                   
                    SocialButton(
                      label: "Apple",
                      iconPath: "assets/images/ios.png",
                      onTap: () => print("Apple Login"),
                    ),
                 ) ],
                ),
              ),

              const SizedBox(height: 20),

              
              SizedBox(height: 20),  

Center(
  child: GestureDetector(
    onTap: () {
      
      print("Go to Register Page");
    },
    child: RichText(
      text: TextSpan(
        style: const TextStyle(
          color: AppColors.thirdTextColor,
          fontSize: 16,
        ),
        children: [
          const TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: "Register",
            style: TextStyle(
              color: AppColors.cardsBackground, 
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline, 
            ),
          ),
        ],
      ),
    ),
  ),
),

const SizedBox(height:10), 
             SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}