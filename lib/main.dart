import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/modules/home/repo/home_repo.dart';
import 'package:pixabay/splash_screen.dart';
import 'package:pixabay/utils/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(create: (context) => HomeRepo(),child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
         appBarTheme:const AppBarTheme(
          surfaceTintColor: Colors.transparent, 
          backgroundColor: Colors.black, 
          titleTextStyle: TextStyle(color: Colors.white)
         ),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        // darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        home: const SplashScreen()),);
  }
}
