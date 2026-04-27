import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';
import 'package:savoir/features/authontication/prasentation/widgets/auth_from_container.dart';
import 'package:savoir/features/authontication/prasentation/widgets/custom_button.dart';
import 'package:savoir/features/authontication/prasentation/widgets/custom_text_form_field.dart';
import 'package:savoir/features/authontication/prasentation/widgets/social_button.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: 40),
              
              Text("Savoir", style: TextStyle(fontSize: 32, color: AppColors.firsttextColor, fontFamily: "Newsreader")),
             
               Text("Begin your literary journey in peace.", style: TextStyle(color: AppColors.thirdTextColor,fontFamily: "Newsreader")),
              
             SizedBox(height: 30),


              AuthFormContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Name", style: TextStyle( fontFamily: "Newsreader",color:AppColors.firsttextColor )),
                   CustomTextFormField(hintText: 'My Name', suffixIcon: Icon(Icons.person_outline)),
                    
                    SizedBox(height: 20),
                    
                     Text("Email", style: TextStyle(fontFamily: "Newsreader",color:AppColors.firsttextColor )),
                    CustomTextFormField(hintText: 'reader@cafe.com', suffixIcon: Icon(Icons.email_outlined)),
                    
                     SizedBox(height: 20),
                    
                     Text("Password", style: TextStyle(fontFamily: "Newsreader",color:AppColors.firsttextColor)),
                     CustomTextFormField(hintText: '********', isObscureText: true, suffixIcon: Icon(Icons.lock_outline)),
                    
                    const SizedBox(height: 30),

                    CustomButton(
                      buttonText: "Create Account",
                      backgroundColor:(AppColors.cardsBackground),
                      onPressed: () {
                 
                      },
                    ),
                    
                    const SizedBox(height: 20),
                    
               
                    Center(
                      child: GestureDetector(
                        
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color:(AppColors.thirdTextColor)),
                            children: [
                               TextSpan(text: "Already have an account? "),
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(color: AppColors.iconsColor, fontFamily: "Newsreader"),
                              ),
                            ],
                          ),
                        ),
                      ),
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