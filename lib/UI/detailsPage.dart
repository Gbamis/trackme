import 'package:flutter/material.dart';
import 'package:leecit/constants.dart';

double _h;
double _w;
class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double aleft;
  double right;
  bool isOpen = false;
  String about="This is a 4 bedroom bungalo, its has full water supply and 247/power";
  
  void open(){
    setState((){
      isOpen = !isOpen;
    });
    
  }
  Widget backgroundImage(double screenW, double screenH) {
    return SizedBox(
      width: screenW,
      height: screenH ,
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        Container(
            width: screenW, child: Image.network(bgUrl, fit: BoxFit.cover)),
        Container(
            width: screenW, child: Image.network(img2, fit: BoxFit.cover)),
      ]),
    );
  }

  Widget _page(BuildContext con) {
    var screen = MediaQuery.of(con).size;
    _h = screen.height;
    _w = screen.width;

    return Stack(children: <Widget>[
      Positioned(
        child: Container(height: _h),
      ),
      Positioned(
        child: backgroundImage(_w, _h),
      ),
      Positioned(
        top: 40,
        child: IconButton(
          iconSize:40,
            onPressed: () {
              Navigator.pop(con);
            },
            icon: Icon(Icons.arrow_back),
            color: bottons),
       
      ),
      AnimatedPositioned(
        duration:Duration(seconds:1),
         curve: Curves.elasticOut,
         bottom:20,left:isOpen? 40:-270,
        child: Opacity(opacity: isOpen? 1:0.8,
                       child:Container(
            width: _w-80,
            height: 100,
            child: Card(
              elevation: 5,
              color:primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(70),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(70),
                  )),
              child: Row(
                children: <Widget>[
                  Expanded(flex:3,
                          child:Text("$about",style:TextStyle(fontSize: 12, color:Colors.white,fontWeight: FontWeight.bold)),),
                  Expanded(flex:1,
                           child: FloatingActionButton(
                             backgroundColor:bottons,
                  child:Icon(Icons.menu),
                  onPressed:(){
                    open();
                  }
                )),
              ]),
            )
            )),
      ),
      
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: _page(context),
    );
  }
}
