import 'package:covid_tracker/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

const Color primary = Color(0xffEB5569);
const Color grey = Color(0xffC0CCDA);
const Color blackandwhite = Color(0xff6C757D);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
