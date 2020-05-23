import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';



class AuthServiceuser  {
  Firestore _db = Firestore.instance;
  Future<void> adduser(AuthResult user,String _name,String _phone,String _address,String _nationalID,String _followcompany,){
    var uid=user.user.uid;
    var docid=user.user.uid;
    var name=_name;
    var phone=_phone;
    var address=_address;
    var nationalid=_nationalID;
    var followcompany=_followcompany;



    var dataMap=Map<String,dynamic>();
    //dataMap['DocumentId']=docid;
    dataMap['userid']=uid;
    dataMap['name']=name;
    dataMap['latitude']=0.012;
    dataMap['longitude']=0.11;

    dataMap['phone']=phone;
    dataMap['address']=address;
    dataMap['nationalid']=nationalid;
    dataMap['followcompany']=followcompany;
    dataMap['timeStamp']=DateTime.now().toIso8601String();
    print(nationalid);
    print(dataMap['timeStamp']);
    print(dataMap);
    return _db.collection('user').add(dataMap);
  }
  Future<void> addnewmessage(FirebaseUser user,String _name,String _company,String _message, String _adminid){
    var uid=user.uid;
    var name=_name;
    var company=_company;
    var message=_message;
    var adminid=_adminid;



    var dataMap=Map<String,dynamic>();
    dataMap['userid']=uid;
    dataMap['name']=name;
    dataMap['company']=company;
    dataMap['message']=message;
    dataMap['adminid']=adminid;

    dataMap['timeStamp']=DateTime.now().toIso8601String();

    print(dataMap['timeStamp']);
    print(dataMap);
    return _db.collection('message_hajj').add(dataMap);
  }
}