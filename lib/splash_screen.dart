import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/modules/home/cubit/home_cubit.dart';
import 'package:pixabay/modules/home/repo/home_repo.dart';
import 'package:pixabay/modules/home/ui/home_screen.dart';
import 'package:pixabay/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), (){
      navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_)=>BlocProvider(
        create: (context) => HomeCubit(context.read<HomeRepo>())..fetch(),
        child: HOmeScreen(),
      )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: loading(),);
  }
}