import 'package:covid_tracker/Api/get_data_api.dart';
import 'package:covid_tracker/Custom%20Widgets/bottom_bar.dart';
import 'package:covid_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

int sElectedIndex = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Dimensions //
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return FutureBuilder(
        future: getapidata(get: worldwide),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Stack(
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
                                        Text(
                                          'World Wide',
                                          style: TextStyle(
                                              fontFamily: 'Nova_Bold',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: screenHeight * 0.030),
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
                                                    snapshot.data['cases']
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
                                                    snapshot.data['active']
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
                                                    snapshot.data['recovered']
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
                                                    snapshot.data['deaths']
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
                                  // Padding(
                                  //   padding: EdgeInsets.only(
                                  //       left: screenWidth * 0.020,
                                  //       right: screenWidth * 0.040),
                                  //   child: Container(
                                  //     height: screenHeight * 0.048,
                                  //     color: Colors.white,
                                  //     child: Row(
                                  //       children: [
                                  //         Container(
                                  //           height: screenHeight * 0.048,
                                  //           width: screenWidth * .4,
                                  //           color:
                                  //               blackandwhite.withOpacity(0.2),
                                  //           child: Padding(
                                  //             padding: EdgeInsets.only(
                                  //                 top: screenHeight * 0.008,
                                  //                 left: screenWidth * 0.010),
                                  //             child: Text(
                                  //               'State/UT',
                                  //               style: TextStyle(
                                  //                   fontFamily: 'Nova_Bold',
                                  //                   fontSize:
                                  //                       screenHeight * 0.022),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: screenWidth * 0.015,
                                  //         ),
                                  //         Container(
                                  //           height: screenHeight * 0.048,
                                  //           width: screenWidth * 0.090,
                                  //           color:
                                  //               blackandwhite.withOpacity(0.2),
                                  //           child: Padding(
                                  //             padding: EdgeInsets.only(
                                  //                 top: screenHeight * 0.010,
                                  //                 left: screenWidth * 0.015),
                                  //             child: Text(
                                  //               'C',
                                  //               style: TextStyle(
                                  //                   color: Color(0xffFF073A),
                                  //                   fontFamily: 'Nova_Regular',
                                  //                   fontWeight: FontWeight.w600,
                                  //                   fontSize:
                                  //                       screenHeight * 0.022),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: screenWidth * 0.015,
                                  //         ),
                                  //         Container(
                                  //           height: screenHeight * 0.048,
                                  //           width: screenWidth * 0.090,
                                  //           color:
                                  //               blackandwhite.withOpacity(0.2),
                                  //           child: Padding(
                                  //             padding: EdgeInsets.only(
                                  //                 top: screenHeight * 0.010,
                                  //                 left: screenWidth * 0.015),
                                  //             child: Text(
                                  //               'A',
                                  //               style: TextStyle(
                                  //                   fontFamily: 'Nova_Regular',
                                  //                   color: Colors.blue,
                                  //                   fontWeight: FontWeight.w600,
                                  //                   fontSize:
                                  //                       screenHeight * 0.022),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: screenWidth * 0.015,
                                  //         ),
                                  //         Container(
                                  //           height: screenHeight * 0.048,
                                  //           width: screenWidth * 0.090,
                                  //           color:
                                  //               blackandwhite.withOpacity(0.2),
                                  //           child: Padding(
                                  //             padding: EdgeInsets.only(
                                  //                 top: screenHeight * 0.010,
                                  //                 left: screenWidth * 0.015),
                                  //             child: Text(
                                  //               'R',
                                  //               style: TextStyle(
                                  //                   fontFamily: 'Nova_Regular',
                                  //                   fontWeight: FontWeight.w600,
                                  //                   color: Colors.green,
                                  //                   fontSize:
                                  //                       screenHeight * 0.022),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: screenWidth * 0.015,
                                  //         ),
                                  //         Container(
                                  //           height: screenHeight * 0.048,
                                  //           width: screenWidth * 0.090,
                                  //           color:
                                  //               blackandwhite.withOpacity(0.2),
                                  //           child: Padding(
                                  //             padding: EdgeInsets.only(
                                  //                 top: screenHeight * 0.010,
                                  //                 left: screenWidth * 0.015),
                                  //             child: Text(
                                  //               'D',
                                  //               style: TextStyle(
                                  //                   fontFamily: 'Nova_Regular',
                                  //                   fontWeight: FontWeight.w600,
                                  //                   color: Colors.grey,
                                  //                   fontSize:
                                  //                       screenHeight * 0.022),
                                  //             ),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
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
                      currentIndex: sElectedIndex,
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          }
        });
  }
}
