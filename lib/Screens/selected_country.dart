import 'package:covid_tracker/Api/get_data_api.dart';
import 'package:covid_tracker/Custom%20Widgets/bottom_bar.dart';
import 'package:covid_tracker/Screens/countries_screen.dart';
import 'package:covid_tracker/Screens/home_screen.dart';
import 'package:covid_tracker/main.dart';
import 'package:flutter/material.dart';

int myindex = 1;

class CountryDetail extends StatefulWidget {
  CountryDetail({super.key});

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

int selectedindex = 0;

class _CountryDetailState extends State<CountryDetail> {
  @override
  Widget build(BuildContext context) {
    // Dimensions //
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      body: FutureBuilder(
          future: getapidata(get: countries),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 280,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage('assets/images/Component_1.png'),
                                fit: BoxFit.cover,
                              )),
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.110,
                                    left: screenWidth * 0.100),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              snapshot.data[selectedindex]
                                                  ['country'],
                                              style: TextStyle(
                                                  fontFamily: 'Nova_Bold',
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                  fontSize:
                                                      screenHeight * 0.030),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CountriesScreen()));
                                                },
                                                icon: Icon(
                                                    Icons
                                                        .arrow_drop_down_outlined,
                                                    color: Colors.white,
                                                    size: screenHeight * 0.030))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Last Updated 1 Hour ago',
                                          style: TextStyle(
                                              fontFamily: 'Nova_Regular',
                                              color: grey),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.120,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.060,
                                  top: screenHeight * 0.290,
                                  right: screenWidth * 0.060),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.200,
                                        width: screenWidth * 0.420,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(
                                                  0.3), // Shadow color
                                              spreadRadius: 8, // Spread radius
                                              blurRadius: 13, // Blur radius
                                              offset: Offset(
                                                  0, 8), // Offset from top
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.025,
                                              left: screenWidth * 0.050),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'CONFIRMED',
                                                style: TextStyle(
                                                    color: Color(0xff8391A7),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Nova_Regular',
                                                    fontSize:
                                                        screenHeight * 0.020),
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.015,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data[selectedindex]
                                                            ['cases']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFF073A),
                                                        fontFamily:
                                                            'Nova_Light',
                                                        fontSize: screenHeight *
                                                            0.025,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.008,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_upward,
                                                    color: Colors.red,
                                                    size: screenHeight * 0.020,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.040,
                                      ),
                                      Container(
                                        height: screenHeight * 0.200,
                                        width: screenWidth * 0.420,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(
                                                  0.3), // Shadow color
                                              spreadRadius: 8, // Spread radius
                                              blurRadius: 13, // Blur radius
                                              offset: Offset(
                                                  0, 8), // // Offset from top
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.025,
                                              left: screenWidth * 0.050),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'ACTIVE',
                                                style: TextStyle(
                                                    color: Color(0xff8391A7),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Nova_Regular',
                                                    fontSize:
                                                        screenHeight * 0.020),
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.015,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data[selectedindex]
                                                            ['active']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontFamily:
                                                            'Nova_Light',
                                                        fontSize: screenHeight *
                                                            0.025,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.008,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_upward,
                                                    color: Colors.blue,
                                                    size: screenHeight * 0.020,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.020,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.200,
                                        width: screenWidth * 0.420,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(
                                                  0.3), // Shadow color
                                              spreadRadius: 8, // Spread radius
                                              blurRadius: 13, // Blur radius
                                              offset: Offset(
                                                  0, 0), // Offset from top
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.025,
                                              left: screenWidth * 0.050),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'RECOVERED',
                                                style: TextStyle(
                                                    color: Color(0xff8391A7),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Nova_Regular',
                                                    fontSize:
                                                        screenHeight * 0.020),
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.015,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data[selectedindex]
                                                            ['recovered']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontFamily:
                                                            'Nova_Light',
                                                        fontSize: screenHeight *
                                                            0.025,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.008,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_upward,
                                                    color: Colors.green,
                                                    size: screenHeight * 0.020,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.040,
                                      ),
                                      Container(
                                        height: screenHeight * 0.200,
                                        width: screenWidth * 0.420,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(
                                                  0.3), // Shadow color
                                              spreadRadius: 9, // Spread radius
                                              blurRadius: 13, // Blur radius
                                              offset: Offset(
                                                  0, 0), // Offset from top
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.025,
                                              left: screenWidth * 0.050),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'DEATHS',
                                                style: TextStyle(
                                                    color: Color(0xff8391A7),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Nova_Regular',
                                                    fontSize:
                                                        screenHeight * 0.020),
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.015,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data[selectedindex]
                                                            ['deaths']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily:
                                                            'Nova_Light',
                                                        fontSize: screenHeight *
                                                            0.025,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.008,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_upward,
                                                    color: Colors.grey,
                                                    size: screenHeight * 0.020,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.030,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Bottombar(
                      currentIndex: myindex,
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
          }),
    );
  }
}
