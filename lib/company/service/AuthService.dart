import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  Firestore _db = Firestore.instance;
  Future<void> addadmin(AuthResult user,String _name,String _phone,String _address,String _nationalID,String _companywork){
    var uid=user.user.uid;
    var name=_name;
    var phone=_phone;
    var address=_address;
    var nationalid=_nationalID;
    var companywork=_companywork;


    var dataMap=Map<String,dynamic>();
    dataMap['userid']=uid;
    dataMap['name']=name;
    dataMap['phone']=phone;
    dataMap['latitude']=0;
    dataMap['longitude']=0;
    dataMap['address']=address;
    dataMap['nationalid']=nationalid;
    dataMap['companyname']=companywork;
    dataMap['timeStamp']=DateTime.now().toIso8601String();
    print(nationalid);
    print(dataMap['timeStamp']);
    print(dataMap);
    return _db.collection('admins').add(dataMap);
  }
  Future<void> addcompany(AuthResult user,String _name,String _phone,String _address){
    var uid=user.user.uid;
    var name=_name;
    var phone=_phone;
    var address=_address;



    var dataMap=Map<String,dynamic>();
    dataMap['userid']=uid;
    dataMap['name']=name;
    dataMap['phone']=phone;
    dataMap['address']=address;

    dataMap['timeStamp']=DateTime.now().toIso8601String();

    print(dataMap['timeStamp']);
    print(dataMap);
    return _db.collection('companies').add(dataMap);
  }
}