import 'package:flutter/material.dart';
import 'package:leecit/UI/mainPage.dart';
import "package:leecit/UI/splashScreen.dart";
import 'package:leecit/UI/addPage.dart';
import 'package:leecit/UI/findPage.dart';
import 'package:leecit/UI/detailsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Splash(),
          "/home": (context) => MainPage(),
          "/add" : (context) => AddProperty(),
          "/findHouse": (context) => FindHouse(),
          "/details" :(context)=>DetailsPage(),
        },
        initialRoute: "/"
    );
  }
}


