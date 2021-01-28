import 'package:flutter/material.dart';
import 'package:leecit/constants.dart';
import 'package:leecit/CONTOLLERS/blocService.dart';
import 'package:leecit/UI/widgets.dart';
import 'package:leecit/MODEL/property.dart';

class FindHouse extends StatefulWidget {
  FindHouse({Key key}) : super(key: key);

  @override
  FindHouseState createState() => FindHouseState();
}

class FindHouseState extends State<FindHouse> {
  Bloc pBloc = Bloc();
  
  @override
  Widget build(BuildContext con) {
    return Scaffold(
      backgroundColor: primary,
      body: _page(con),
    );
  }

  Widget _page(BuildContext con) {
    var size = MediaQuery.of(con).size;
    double h = size.height;
    double w = size.width;

    return Container(
      width: w,
      height: h,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: w / 6,
            top: 20,
            width: w - (w / 3),
            child: SearchBar(searching: (value) {}),
          ),
          Positioned(
            bottom: 1,
            width: w,
            height: h - 100,
            child: _stream(con),
          ),
        ],
      ),
    );
  }

  Widget _stream(BuildContext con){
    return StreamBuilder(
      stream:pBloc.sc.stream,
      builder:(con,snapshot){
        if(snapshot.data==null)
          return Text("nothing to show");
        return ListView.builder(
          itemCount:pBloc.p.length,
          itemBuilder:(con,index){
            Property pp = snapshot.data[index];
            return _listItem(pp);
          }
        );
      }
    );
  }
  Widget _listItem(Property p){
    return PropertyCard.fromProperty(p);
  }
  
}