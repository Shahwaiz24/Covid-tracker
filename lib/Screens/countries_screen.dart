import 'package:covid_tracker/Api/get_data_api.dart';
import 'package:covid_tracker/Screens/selected_country.dart';
import 'package:flutter/material.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
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
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.030,
                            left: screenWidth * 0.040),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.020,
                            ),
                            Text(
                              'Choose Your Country',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Nova_Bold',
                                  fontSize: screenHeight * 0.030),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.030,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(left: screenWidth * 0.030),
                              child: ListTile(
                                title: Text(
                                  snapshot.data[index]['country'].toString(),
                                  style: TextStyle(
                                      fontFamily: 'Nova_Bold',
                                      fontSize: screenHeight * 0.022,
                                      fontWeight: FontWeight.w600),
                                ),
                                leading: Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.network(
                                    snapshot.data[index]["countryInfo"]['flag'],
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Icon(Icons.error_outline),
                                      );
                                    },
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedindex = index;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CountryDetail()));
                                  });
                                },
                              ),
                            );
                          }),
                      Container(
                        height: 200,
                      ),
                    ],
                  ),
                ),
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
