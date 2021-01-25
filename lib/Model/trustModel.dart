import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class TrusteeModel {
  String gmail;
  List<dynamic> trustees =[];

  TrusteeModel({this.gmail,this.trustees});

  factory TrusteeModel.fromDoc(DocumentSnapshot snapshot){
    return TrusteeModel(gmail:snapshot['email'],
                        trustees:snapshot['trustees']);
  }
}

