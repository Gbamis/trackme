import 'package:flutter/material.dart';
import 'UI/mainPage.dart';
import 'UI/mapView.dart';
import 'UI/trackPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => MainPage(),
          "/track": (context) => TrackPage(),
          "/map": (context) => MapView(),
        },
        initialRoute: "/");
  }
}


