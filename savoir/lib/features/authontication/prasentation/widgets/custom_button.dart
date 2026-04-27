import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor; // ضيفنا السطر ده (علامة ? معناها إنه اختياري)

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor, // ضيفناه في الـ Constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
           
            backgroundColor: backgroundColor ?? const Color(0xFF8B4513), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Newsreader"),
          ),
        ),
      ),
    );
  }
}