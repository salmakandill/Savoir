import 'package:flutter/material.dart';
import 'package:savoir/features/home/presentation/widgets/customBouttomNavbar.dart';

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
      home: Custombouttomnavbar()
    );
  }
}