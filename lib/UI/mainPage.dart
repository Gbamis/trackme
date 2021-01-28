import "package:leecit/constants.dart";
import "package:flutter/material.dart";
import "package:leecit/UI/widgets.dart";

class MainPage extends StatelessWidget {
  Widget _backgroundImage(double w, double h) {
    return Container(
      height: h,
      width: w,
      child: ClipPath(
        clipper: MyClipper(),
        child: Image.network(bgUrl, fit: BoxFit.cover),
      ),
    );
  }

  Widget _page(BuildContext con) {
    
    var size = MediaQuery.of(con).size;
    h = size.height;
    w = size.width;

    return Container(
      child: Stack(children: <Widget>[
        Positioned(
          child: _backgroundImage(w, h),
        ),
        Positioned(
          bottom: 10,
          left: w/5,
          child: Row(children: <Widget>[
            Button(
                title: "Rent yours",
                height: 50,
                width: 150,
                bgColor: bottons,
                onTap: () {
                  Navigator.of(con).pushNamed("/add");
                }),
            SizedBox(width: 10),
            Button(
                title: "Find",
                height: 50,
                width: 150,
                bgColor: bottons,
                onTap: () {
                  Navigator.of(con).pushNamed("/findHouse");
                }),
          ]),
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0, size.height - (size.height / 3));
    path.quadraticBezierTo(size.width / 2, size.height - 10, size.width,
        size.height - (size.height / 3));
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}