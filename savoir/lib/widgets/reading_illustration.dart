import 'package:flutter/material.dart';

class ReadingIllustration extends StatelessWidget {
  const ReadingIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          'assets/images/reading.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
