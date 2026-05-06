import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/also_like_cubit.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/details_cubit.dart';
import 'package:savoir/features/details/presentation/screens/details_screen.dart';
import 'package:savoir/features/home/presentation/cubit/home_recommended_cubit.dart';
import 'package:savoir/features/home/presentation/screens/home_screen.dart';
import 'package:savoir/features/authentication/presentation/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:savoir/features/reading_fatures/data/services/data_source/history_keeper.dart';
import 'package:savoir/features/reading_fatures/presentation/cubits/history_cubit.dart';
import 'firebase_options.dart';

void main() async {
  //await FirebaseAuth.instance.signOut();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await HistoryKeeper.init();
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => HomeCubit()..getBooks()), 
      BlocProvider(create: (context) => HistoryCubit()),
      BlocProvider(create: (context) => DetailsCubit()),
      BlocProvider(create: (context) => AlsoLikeCubit()),
    ],
      child :Savoir()));
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
