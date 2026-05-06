import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/login_screen.dart';

class Cutomheader extends StatelessWidget {
  const Cutomheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'SAVOIR',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xff6E5B46),
          ),
        ),
        TextButton(
          child: Text(
            'SKIP',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xff6E5B46),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
      ],
    );
  }
}
