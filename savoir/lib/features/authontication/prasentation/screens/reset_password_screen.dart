import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savoir/features/authontication/widget/appbar.dart';
import 'package:savoir/features/authontication/widget/buildField.dart';
import 'package:savoir/models/app_colors.dart';

void main() {
  runApp(const ResetPasswordScreen());
}

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: customeAppbar(),
        body: Stack(
          children: [
            
            Column(
              children: [
                SizedBox(height: 24), 

               
                Expanded(
                  child: SingleChildScrollView(
                    padding:  EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Container(
                          padding:EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.appbarcolor,
                             boxShadow:[ BoxShadow(color: AppColors.appbartextcolor,blurRadius: 10,offset: Offset(0, 5))]
                          ),
                          child: const Icon(
                            Icons.lock_reset,
                            size: 38,
                            color:AppColors.cardsBackground,
                          ),
                        ),

                        const SizedBox(height: 14),

                       
                        Text(
                          "Reset Password",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.cardsBackground,
                          ),
                        ),

                        const SizedBox(height: 8),

                      
                        Text(
                          "Create a new secure password for your reading sanctuary.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: AppColors.thirdTextColor,
                          ),
                        ),

                        const SizedBox(height: 20),

                       
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: Column(
                            children: const [
                              CustomTextField(label: "NEW PASSWORD"),
                              SizedBox(height: 15),
                              CustomTextField(label: "CONFIRM PASSWORD"),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                      
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: AppColors.cardsBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Update Password",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        
                        Column(
                          children: [
                            Text(
                              '"A room without books is like a body without a soul."',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: AppColors.thirdTextColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "- CICERO",
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                letterSpacing: 2,
                                color: AppColors.cardsBackground,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}