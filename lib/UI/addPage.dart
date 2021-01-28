import 'package:flutter/material.dart';
import 'package:leecit/UI/widgets.dart';
import 'package:leecit/constants.dart';

class AddClipper extends CustomClipper<Path> {
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
class AddProperty extends StatefulWidget{
  AddProperty({Key key}): super(key:key);
  @override
  AddState createState()=> AddState();
}

class AddState extends State<AddProperty>{
  TextEditingController city = TextEditingController();
  TextEditingController mtype = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController contact = TextEditingController();
 
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //List<File> propertyImages =[];
  
  @override
  Widget build(BuildContext con){
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:primary,
      body:_page(con),
    );
  }
  Widget _header(BuildContext con){
    double w = MediaQuery.of(con).size.width;
    return ClipPath(
      clipper: AddClipper(),
      child:Container(
        height:300,width:w,
        color:bottons,
        child:Center(
          child:Text("Rent\nYour Property",
                     style:TextStyle(color:primary,fontSize:40,fontWeight:FontWeight.bold))
        ),
      ),
    );
  }
  Widget _photoSection(BuildContext con){
    return Row(
      children:<Widget>[
        Expanded(child:PhotoCard(addPhoto:(){getPicture();},mWidth:50,mHeight:90),),
        Expanded(child:PhotoCard(addPhoto:(){getPicture();},mWidth:50,mHeight:90),),
        Expanded(child:PhotoCard(addPhoto:(){getPicture();},mWidth:50,mHeight:90),),
      ],
    );
  }
  
  final scaf = SnackBar(
    
    backgroundColor:Colors.blueGrey[600],
    elevation:20,
    duration:Duration(seconds:2),
    content:Text("property published succesfully"),
  );
  void getPicture(){
    print("added a picture");
  }
  
  void submitDetails(BuildContext con){
    if(city.text.isEmpty || mtype.text.isEmpty || amount.text.isEmpty || contact.text.isEmpty)
      return;
    print(city.text);
    print(mtype.text);
    print(amount.text);
    print(about.text);
    print(contact.text);
    
   _scaffoldKey.currentState.showSnackBar(scaf);
    //Navigator.of(con).pop();
  }
  //TextInput({Key key, this.searching,this.myPrefIcon,this.myhintText});
  Widget _page(BuildContext con){
    double w = MediaQuery.of(con).size.width;
    return Column(
      children:<Widget>[
        _header(con),
        Padding(
          padding:EdgeInsets.fromLTRB(20,0,20,0),
          child:Column(
            children:<Widget>[
              TextInput(controller:city,myPrefIcon:Icon(Icons.add_location),myhintText:"City"),
              Row(
                children:<Widget>[
                  Expanded(
                    
                    child:TextInput(controller:mtype,myPrefIcon:Icon(Icons.add_location),myhintText:"Type"),
                  ),
                  Expanded(
                    
                    child:TextInput(controller:amount,myPrefIcon:Icon(Icons.add_location),myhintText:"\$Amount"),
                  ),
                ]
              ),
              SizedBox(height:20),
              Text("Property Images",style:TextStyle(color:Colors.white,fontSize:19)),
              _photoSection(con),
              TextInput(controller:about,myPrefIcon:Icon(Icons.add_location),myhintText:"About"),
              TextInput(controller:contact,myPrefIcon:Icon(Icons.add_location),myhintText:"Contact"),
              SizedBox(height:20),
              Row(
                children:<Widget>[
                  SizedBox(width:w/6),
                  Button(title:"Rent",height:50,width:120,bgColor:bottons,
                         onTap:(){
                           try{
                              submitDetails(con);
                           }
                           catch (e){
                             print(e);
                           }
                         }),
                  Button(title:"Cancel",height:50,width:120,bgColor:error,onTap:(){Navigator.of(con).pop();}),
                ]
              ),
            ],
          ),
        ),
      ],
    );
  }
}