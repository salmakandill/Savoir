import 'package:flutter/material.dart';
import 'package:savoir/models/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.thirdTextColor.withOpacity(0.5)),
        filled: true,
        fillColor: Colors.white, 
        
        enabledBorder: OutlineInputBorder(
    
          borderSide: BorderSide(color: Colors.white),
        ),
        
       
        focusedBorder: OutlineInputBorder(
  
          borderSide: BorderSide(color: AppColors.iconsColor),
        ),
        
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}