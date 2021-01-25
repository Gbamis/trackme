import "package:cloud_firestore/cloud_firestore.dart";

class FireBaseAPI{

  CollectionReference collRef;

  FireBaseAPI(){
    collRef = Firestore.instance.collection('Users');
  }
}