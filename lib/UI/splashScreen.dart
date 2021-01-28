import "package:flutter/material.dart";
import "package:leecit/constants.dart";

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext con) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
          child: Text("Finder",
              style: TextStyle(
                  fontSize: 60, color: bottons, fontWeight: FontWeight.bold))),
    );
  }
}