import "dart:async";
import "package:leecit/MODEL/property.dart";
import "package:leecit/constants.dart";

class Bloc{
  List<Property> p =[];
  StreamController<List<Property>> sc = StreamController();
  
  Bloc(){
    Property a = Property(imageUrl:bgUrl,city:"Lokoja",
                          amount:"\$1000",about:"v",
                          pType:"Housing",docRef:"1w2",ownerContact:"79092");
    Property b = Property(imageUrl:bgUrl,city:"Lokoja",
                          amount:"\$1500",about:"v",
                          pType:"Electronics",docRef:"1w2",ownerContact:"79092");
    Property c = Property(imageUrl:bgUrl,city:"Lokoja",
                          amount:"\$800",about:"v",
                          pType:"Automobile",docRef:"1w2",ownerContact:"79092");
    
    p.add(a);
    p.add(b);
    p.add(c);
    
    sc.sink.add(p);
  }
}