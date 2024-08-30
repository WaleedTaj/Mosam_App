import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is an init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set State Called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    // Check if arguments are provided before accessing them
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp = "N/A";
    String airSpeed = "N/A";

    if (info != null) {
      if (info.containsKey('temp_value')) {
        temp = info['temp_value'].toString();
        if (temp != "N/A" && temp.length >= 4) {
          temp = temp.substring(0, 4);
        }
      }

      if (info.containsKey('air_speed_value')) {
        airSpeed = info['air_speed_value'].toString();
        if (airSpeed != "N/A" && airSpeed.length >= 4) {
          airSpeed = airSpeed.substring(0, 4);
        }
      }
    }

    String icon = info?['icon_value'];
    String getCity = info?['city_value'];
    String humidity = info?['humidity_value'];
    String description = info?['description_value'];

    var cityNames = [
      "Lahore",
      "Karachi",
      "Islamabad",
      "Rawalpindi",
      "London",
      "Mumbai",
      "Delhi",
      "Swat",
      "Paris",
      "New York City",
      "London",
      "England",
      "Bangkok",
      "Thailand",
      "Hong Kong",
      "China",
      "Dubai",
      "United Arab Emirates",
      "Singapore",
      "Rome",
      "Italy",
      "Macau",
      "China",
      "Istanbul",
      "Turkey",
      "Kuala Lumpur",
      "Malaysia",
      "Delhi",
      "India",
      "Tokyo",
      "Japan",
      "Antalya",
      "Turkey",
      "Mexico City",
      "Mexico",
      "Porto",
      "Portugal",
      "San Francisco",
      "USA",
      "Beijing",
      "China",
      "Los Angeles",
      "USA",
      "Chicago",
      "USA",
      "Barcelona",
      "Spain",
      "Abu Dhabi",
      "United Arab Emirates",
      "Amsterdam",
      "Netherlands",
      "Madrid",
      "Spain",
      "Sydney",
      "Australia",
      "Mexico",
      "Lisbon",
      "Portugal",
      "Vienna",
      "Austria",
    ];
    final random = Random();
    var city = cityNames[random.nextInt(cityNames.length)];
    Color myColor = const Color(0xFF1565C0);
    Color myColor2 = const Color(0xFF64B5F6);

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: myColor,
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: GradientAppBar(
            gradient: LinearGradient(
                colors: [myColor, myColor],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          // Main Container
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  myColor,
                  myColor2,
                ],
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 9, 1, 0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/logo.png"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mosam App",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'AsapCondensed',
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // Search Container
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.fromLTRB(24, 8, 24, 15),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20)
                          ],
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city Here...",
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                            print("Blank Search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: const Text(
                            "Search",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  description,
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "AnekLatin"),
                                ),
                                Text(
                                  "in $getCity",
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin:
                            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/logo.png"),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Temperature",
                                  style: TextStyle(
                                      fontSize: 33,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "AnekLatin"),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        temp,
                                        style: const TextStyle(
                                          fontSize: 100,
                                          fontFamily: "AsapCondensed",
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.fromLTRB(0, 0, 20, 35),
                                        child: const Column(
                                          children: [
                                            Text(
                                              "\u00B0C",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.fromLTRB(18, 0, 6.5, 0),
                        padding: const EdgeInsets.all(12),
                        height: 150,
                        child: Column(
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/9.png"),
                                ),
                                Text(
                                  "Air Speed",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "AnekLatin"),
                                ),
                              ],
                            ),
                            Text(
                              airSpeed,
                              style: const TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "km/hr",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.fromLTRB(6.5, 0, 18, 0),
                        padding: const EdgeInsets.all(12),
                        height: 150,
                        child: Column(
                          children: [
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/humidity.png"),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Humidity",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "AnekLatin"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              humidity,
                              style: const TextStyle(
                                  fontSize: 38, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "percent(%)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Made By Waleed Taj",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Data Provided By Openweathermap.org",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
