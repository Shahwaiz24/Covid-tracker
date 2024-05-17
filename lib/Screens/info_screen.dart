import 'package:covid_tracker/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override    
  Widget build(BuildContext context) {
    // Dimensions //
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Under Construction',
              style: TextStyle(
                  fontFamily: 'Nova_Bold',
                  fontSize: screenHeight * 0.030,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.020,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: Text('Go Back')),
          ),
        ],
      ),
    );
  }
}
