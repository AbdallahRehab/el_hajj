import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elhajj/hajj/viewmessage1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HajjNotification extends StatefulWidget {
  final FirebaseUser user;

  const HajjNotification({Key key, this.user}) : super(key: key);


  @override
  _HajjNotificationState createState() => _HajjNotificationState();
}

class _HajjNotificationState extends State<HajjNotification> {
  List<String> datas = [
    'Message',
    'Message',
    'Message',

  ];
  String followcompany;
  @override
  Widget build(BuildContext context) {
    String iduser=widget.user.uid;
    Future<QuerySnapshot> getData=Firestore.instance.collection("user").where('userid',isEqualTo:iduser).getDocuments()
        .then((value){
      value.documents.forEach((result){
        followcompany=result.data['followcompany'];
        print(followcompany);
        print(result.data['followcompany']);
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: Text('Message Panal',style: TextStyle(
            color: Colors.teal[600],
            fontSize:22,
            fontWeight: FontWeight.w600
          ),),
        elevation: 0,
      ),
      body: new StreamBuilder(

          stream: Firestore.instance.collection("message_admin").where('company',isEqualTo:followcompany).snapshots(),
          builder: (context,snapshots){
            if(!snapshots.hasData){
              return Center(child: new Text("CONNECTING....."));
            }
            return
              ListView.builder(
                  itemCount: snapshots.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds=snapshots.data.documents[index];
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 0.5, horizontal: 3.0),
                      child: Card(
                        color: Colors.teal[600],
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewMessage(name: ds['name'],message: ds['message'],)));
                          },
                          title: Text(
                            ds['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Flatbut(),
                          ),
                        ),
                      ),
                    );
                  });
  })
    );
  }

  Widget Flatbut() {
    return FlatButton(
      color: Colors.deepOrange[500],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        "View",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      ),
      onPressed: () {},
    );
  }
}