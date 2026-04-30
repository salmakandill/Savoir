import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/splash_screen.dart';

void main() {
  runApp(Savoir());
}

class Savoir extends StatelessWidget {
  const Savoir({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Newsreader'),
      home: SplashScreen(),
    );
  }
}
