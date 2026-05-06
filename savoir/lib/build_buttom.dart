import 'package:flutter/material.dart';
import 'package:savoir/features/details/presentation/screens/reading_screen.dart';

class Buttomwidget extends StatelessWidget {
  const Buttomwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReadingScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff8D4F1D),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: const Text(
        "Read Now",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
    
  }
}
