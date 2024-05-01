import 'dart:async';

import 'package:covid_tracker/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff222B45),
      body: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/images/Splashscreen.png'),
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
