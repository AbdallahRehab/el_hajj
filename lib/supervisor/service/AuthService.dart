import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';



class AuthServiceadmin  {
  Firestore _db = Firestore.instance;

  Future<void> addnewmessage(FirebaseUser user,String _name,String _company,String _message){
    var uid=user.uid;
    var name=_name;
    var company=_company;
    var message=_message;




    var dataMap=Map<String,dynamic>();
    dataMap['userid']=uid;
    dataMap['name']=name;
    dataMap['company']=company;
    dataMap['message']=message;


    dataMap['timeStamp']=DateTime.now().toIso8601String();

    print(dataMap['timeStamp']);
    print(dataMap);
    return _db.collection('message_admin').add(dataMap);
  }
}