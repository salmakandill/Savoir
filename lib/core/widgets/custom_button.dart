import 'package:flutter/material.dart';
import 'package:savoir/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child :SizedBox(
      width:460, // الزرار ياخد العرض المتاح كله
      height: 60, // طول مناسب للزرار زي الفيجما
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B4513), // اللون البني (أو استخدم AppColors.iconsColor)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // حواف مستديرة
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward, // أيقونة السهم اللي في التصميم
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    ));
  }
}