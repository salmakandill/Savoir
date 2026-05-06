import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savoir/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:savoir/features/details/presentation/screens/details_screen.dart';
import 'package:savoir/features/home/presentation/screens/home_screen.dart';
import 'package:savoir/features/authentication/presentation/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'firebase_options.dart';

void main() async {
  //await FirebaseAuth.instance.signOut();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
