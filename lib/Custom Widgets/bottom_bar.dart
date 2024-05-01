import 'package:covid_tracker/Screens/countries_screen.dart';
import 'package:covid_tracker/Screens/home_screen.dart';
import 'package:covid_tracker/Screens/info_screen.dart';
import 'package:covid_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bottombar extends StatelessWidget {
  final int currentIndex;
  const Bottombar({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(FontAwesomeIcons.earthAfrica,
                  color: currentIndex == 0 ? primary : Colors.grey),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }),
          IconButton(
            icon: Icon(FontAwesomeIcons.flag,
                color: currentIndex == 1 ? primary : Colors.grey),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CountriesScreen()));
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.circleInfo,
                color: currentIndex == 2 ? primary : Colors.grey),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const InfoScreen()));
            },
          ),
        ],
      ),
    );
  }
}
