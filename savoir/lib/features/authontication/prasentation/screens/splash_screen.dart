import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savoir/models/app_colors.dart';

void main() {
  runApp(const SavoirScreen());
}

class SavoirScreen extends StatelessWidget {
  const SavoirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),

         
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.appbarcolor,
                width:0,
              ),
            ),
            child: ClipRRect(
              child: Stack(
                children: [
                                    Positioned.fill(child:
                                     Center(
                                       child: Opacity(opacity: 0.08,
                                         child: Image.asset("assets/images/back.png",
                                       height:double.infinity,width: double.infinity,
                                        fit: BoxFit.cover, ),
                                       ),
                                     ),
                                  ),
                               
                            

                 
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(color: Colors.transparent.withValues(alpha: 0.2)),
                    
                  ),

                   Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.cardsBackground.withValues(alpha: 0.2),
                          AppColors.background.withValues(alpha: 0.2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [

                        const SizedBox(height: 55),

                       
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 35,
                            height: 90,
                            decoration: BoxDecoration(
                              color: AppColors.appbartextcolor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: const Align(
                              alignment: Alignment(0, 0.6),
                              child: Icon(
                                Icons.bookmark,
                                size: 18,
                                color: AppColors.appbarcolor,
                              ),
                            ),
                          ),
                        ),

                        const Spacer(),

                        Container(
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.appbarcolor,
                          ),
                          child: const Icon(
                            Icons.menu_book,
                            size: 38,
                            color: AppColors.iconsColor,
                          ),
                        ),

                        const SizedBox(height: 18),

                      
                        Text(
                          "Savoir",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: AppColors.firsttextColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                       
                        

                       Text(
                            "THE ART OF READING",
                            style: GoogleFonts.montserrat(
                              letterSpacing: 2.5,
                              fontSize: 11,
                              color: AppColors.secondTextColor,
                            ),
                          ),const SizedBox(height: 50),

                        
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                "assets/images/book.png",
                                height: 200,width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '"Find sanctuary in every page."',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: AppColors.secondTextColor,
                                  ),
                                ),
                                                        const SizedBox(height: 25),
                                
                                                       
                                                        Container(
                                                          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 12,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                                                          ),
                                                          child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.firsttextColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 42, vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      "START YOUR JOURNEY",
                                      style: TextStyle(fontSize: 12,color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_forward, size: 18,color: Colors.white),
                                  ],
                                ),
                                                          ),
                                                        ),
                              ],
                            ),
                          ],
                        

                     ) ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}