import 'package:flutter/material.dart';
import 'package:leecit/MODEL/property.dart';

import 'package:leecit/constants.dart';

class SearchBar extends StatefulWidget {
  final Function(String) searching;
  SearchBar({Key key, this.searching});
  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  //keyboard_arrow_left_sharp
  @override
  Widget build(BuildContext con) {
    return Container(
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Search for houses",
            prefixIcon: Icon(Icons.menu),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}


class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final Icon myPrefIcon;
  final String myhintText;
  
  TextInput({Key key,this.myPrefIcon,this.myhintText,this.controller});
  @override
  TextInputState createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  //keyboard_arrow_left_sharp
  @override
  Widget build(BuildContext con) {
    return Container(
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.myhintText,
            prefixIcon: widget.myPrefIcon,
          ),
        ),
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final VoidCallback addPhoto;
  final double mWidth;
  final double mHeight;
  
  PhotoCard({Key key,this.addPhoto,this.mWidth,this.mHeight});
  
  @override
   Widget build(BuildContext con) {
    return Container(
      width:mWidth,height:mHeight,
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child:IconButton(icon:Icon(Icons.add),iconSize:30,onPressed:(){addPhoto();}),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final double height, width;
  final Color bgColor;
  final VoidCallback onTap;

  Button(
      {Key key, this.title, this.height, this.width, this.bgColor, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext con) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: width,
          height: height,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: bgColor,
              child: Center(
                child: Text('$title',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight:FontWeight.bold
                    )),
              )),
        ));
  }
}

class PropertyCard extends StatelessWidget {
  
  //final VoidCallback onView;
  //final Function(String) viewHouse;

  final String imageUrl, city,rentPrice,ownerContact, docRef,pType;

  PropertyCard(
      {Key key,
      this.imageUrl,
       this.city,
      this.rentPrice,
       this.docRef,
       this.ownerContact,
       this.pType})
      : super(key: key);
  
  factory PropertyCard.fromProperty(Property p){
    return PropertyCard(
      imageUrl:p.imageUrl,
      rentPrice:p.amount,
      city:p.city,
      docRef:p.docRef,
      ownerContact:p.ownerContact,
      pType:p.pType, 
    );
  }
  
  Widget _roomType(BuildContext con) {
    if(pType=="Housing")
      return Icon(Icons.home);
    if(pType=="Automobile")
      return Icon(Icons.drive_eta);
    if(pType=="Electronics")
      return Icon(Icons.dock);
    return Icon(Icons.dock);
  }

  @override
  Widget build(BuildContext con) {
    double w = MediaQuery.of(con).size.width;
    return GestureDetector(
      onTap: () {
        
        //onView();
        //viewHouse(docRef);
      },
      child: Container(
          //color: Colors.white,
          width: w,
          height: 390,
          child: Card(
            //color:listItemColor,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
            child:Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Container(
                height: 270,
                width: w,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$rentPrice',
                    style: TextStyle(
                      fontSize: 30,fontWeight:FontWeight.bold,
                    )),
              ),
              Row(children: <Widget>[
                _roomType(con),
                SizedBox(width:200),
                
                //{Key key, this.title, this.height, this.width, this.bgColor, this.onTap})
               Expanded(
                 child: Button(title:"Contact",height:50,width:120,
                               bgColor:bottons,
                               onTap:(){
                                 print("x");
                                 Navigator.pushNamed(con,"/details");
                               }),
               ), 
              ]),
            ]),
          )
          ),
      ),
    );
  }
}