import 'package:trackme/Constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  Widget _page(BuildContext con) {
    final _gUrl = '''https://cdn.worldvectorlogo.com/logos/google-icon.svg''';

    var size = MediaQuery.of(con).size;
    h = size.height;
    w = size.width;
    double _hh = h - (h / 3) - 100;
    return Center(
      child: Column(children: <Widget>[
        SizedBox(height: _hh),
        Text("TrackMe",
            style: TextStyle(
                fontSize: 80, color: bottons, fontWeight: FontWeight.bold)),
        Container(
          width: w - (w / 2),
          height: 100,
          child: Card(
              color: bottons,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Center(
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Container(
                    width: 30,
                    height: 30,
                    child: Image.network(_gUrl, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: Text("Sign in with google",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                    flex: 1,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: FloatingActionButton(
                          backgroundColor: primary,
                          child: Icon(Icons.navigation),
                          onPressed: () {
                            Navigator.pushNamed(con, "/track");
                          }),
                    ),
                  ),
                ]),
              )),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext con) {
    return Scaffold(
      backgroundColor: primary,
      body: _page(con),
    );
  }
}
