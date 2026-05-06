// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:savoir/features/authentication/presentation/screens/splash_screen.dart';
import 'package:savoir/features/home/presentation/cubit/category_cubit.dart';
import 'package:savoir/features/home/presentation/Screens/genres_screen.dart';
import 'package:savoir/features/profile/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/home/presentation/Screens/home_screen.dart';
import 'package:savoir/features/home/presentation/cubit/home_recommended_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..getBooks()),
        BlocProvider(create: (context) => HomeGenresCubit()..fetchAllGenres()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Newsreader'),
        home: SplashScreen(),
      ),
    );
  }
}
