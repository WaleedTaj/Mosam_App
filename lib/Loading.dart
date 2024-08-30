import 'package:flutter/material.dart';
import 'package:mosam_app/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Lahore";

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_value": instance.temp,
        "humidity_value": instance.humidity,
        "air_speed_value": instance.air_speed,
        "description_value": instance.description,
        "main_value": instance.main,
        "icon_value": instance.icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
      if (search?.isNotEmpty ?? false) {
        city = search?['searchText'];
      }
      startApp(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 200),
              Image.asset(
                "assets/images/logo.png",
                height: 170,
                width: 170,
              ),
              const SizedBox(height: 30),
              const Text(
                "Mosam App",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'AsapCondensed',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Made By Waleed Taj",
                style: TextStyle(
                  fontFamily: 'Saira',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              const SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[500],
    );
  }
}
