import 'package:http/http.dart';
import 'dart:convert';

class worker {
  String location = "null";

  worker({required this.location}) {
    location = location;
  }
  String temp = "null";
  String humidity = "null";
  String air_speed = "null";
  String description = "null";
  String main = "null";
  String icon = "null";

  // method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "// add here your api key"));
      Map data = jsonDecode(response.body);

      // Getting temp and humidity from main
      /* Celsius to Fahrenheit: Multiply the °C temperature by 1.8. Add 32 to this number. °F = (°C x 1.8) + 32.
      Celsius to Kelvin: K = C + 273.15.
      Kelvin to Celsius: C = K – 273.15.
      Fahrenheit to Celsius: C = (F-32) (5/9).
      Fahrenheit to Kelvin: K = (F-32) (5/9) + 273.15. */
      Map mainData = data['main'];
      double getTemp = mainData['temp'] - 273.15;
      String getHumidity = mainData['humidity'].toString();

      // Getting speed from wind
      Map windData = data['wind'];
      double getAirSpeed = windData['speed'] * 3.6;

      // Getting main (what is situation of weather) and description from weather
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMain = weatherMainData['main'];
      String getDescription = weatherMainData['description'];
      String iconData = weatherMainData['icon'].toString();

      // Assigning Values
      temp = getTemp.toString(); // Celsius
      humidity = getHumidity; // %
      air_speed = getAirSpeed.toString(); // km/hr
      description = getDescription;
      main = getMain;
      icon = iconData;
    } catch (e) {
      temp = "N/A";
      humidity = "N/A";
      air_speed = "N/A";
      description = "N/A";
      main = "N/A";
      icon = "03n";
    }
  }
}
