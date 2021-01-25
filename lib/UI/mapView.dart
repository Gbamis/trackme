import 'package:trackme/Constants.dart';
import 'package:flutter/material.dart';

class MapView extends StatefulWidget {
  MapView({Key key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext con) {
    return Scaffold(
        appBar: AppBar(backgroundColor: primary,),
        backgroundColor: primary,
        body: _map(con));
  }

  Widget _map(BuildContext con) {
    double w = MediaQuery.of(con).size.width;
    double h = MediaQuery.of(con).size.height;

    final _gUrl = '''https://cdn.worldvectorlogo.com/logos/google-icon.svg''';
    final _url =
        '''https://cdn-media-1.freecodecamp.org/images/73UfeBjpfHsq3uh5Bw7vf9VNqspepghd9Hlu''';
    
    return Container(
      width: w - 1,
      height: h - 1,
      child: Stack(children: <Widget>[
        Positioned(
          top: 1,
          child: Container(
              color: Colors.grey,
              width: w,
              height: h,
              child: Image.network(_url, fit: BoxFit.cover)),
        ),
        Positioned(
          left: w/4,
          bottom: 40,
          height: 70,
          width: w - (w / 2),
          child: Container(
            child: Card(
                color: bottons,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Center(
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: CircleAvatar(radius:20,backgroundImage:NetworkImage(_gUrl))
                    ),
                    SizedBox(width: 1),
                    Expanded(
                        flex: 2,
                        child: Text("gbamis.com",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                    
                  ]),
                )),
          ),
        ),
      ]),
    );
  }
}