import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class customeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const customeAppbar({super.key});
@override 
Widget build(BuildContext context){

   return AppBar(
        foregroundColor:AppColors.appbarcolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.iconsColor),
          onPressed: () {},
        ),
        title: Text(
          "Savoir",
          style: GoogleFonts.playfairDisplay(color:AppColors.appbartextcolor),
        ),
        centerTitle: true,
      );}
       @override
  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

      }