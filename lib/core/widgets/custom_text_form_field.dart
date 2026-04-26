import 'package:flutter/material.dart';
import 'package:savoir/app_colors.dart';

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
        fillColor: Colors.white, // لون الحقل من الداخل أبيض زي الفيجما
        
        // الحواف في الحالة العادية
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        
        // الحواف لما تضغط على الحقل
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.iconsColor),
        ),
        
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}