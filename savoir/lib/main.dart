import 'package:flutter/material.dart';
import 'package:savoir/features/authontication/prasentation/screens/login_screen.dart';
import 'package:savoir/features/authontication/prasentation/screens/otp_screen.dart';
import 'package:savoir/features/authontication/prasentation/screens/sign_up_screen.dart';
import 'package:savoir/features/authontication/prasentation/widgets/otp_widgets.dart';
import 'package:savoir/features/home/presentation/widgets/custom_bouttom_navbar.dart';


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
      home:VerificationScreen()
    );
  }
}