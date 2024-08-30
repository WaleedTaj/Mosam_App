import 'package:flutter/material.dart';
import 'package:mosam_app/home.dart';
import 'package:mosam_app/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const Loading(),
      "/home": (context) => const Home(),
      "/loading": (context) => const Loading(),
    },
  ));
}
