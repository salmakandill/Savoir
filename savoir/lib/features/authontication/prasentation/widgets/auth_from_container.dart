import 'package:flutter/material.dart';

class AuthFormContainer extends StatelessWidget {
  final Widget child; 

  const AuthFormContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        
        color: const Color(0xFFF3E5D5).withOpacity(0.5), 
        borderRadius: BorderRadius.circular(28),
      ),
      child: child, 
    );
  }
}