import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savoir/models/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    this.obscureText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

       
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            letterSpacing: 1,
            color: AppColors.firsttextColor,
          ),
        ),

        const SizedBox(height: 6),

      
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.appbarcolor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(Icons.visibility_outlined),
          ),
        ),
      ],
    );
  }
}