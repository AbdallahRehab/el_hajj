import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elhajj/hajj/supervisor_data.dart';
import 'package:elhajj/supervisor/message2.dart';
import 'package:elhajj/supervisor/supervisorNotification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';



class SupervisorsPage extends StatefulWidget {
  final FirebaseUser user;

  const SupervisorsPage({Key key, this.user}) : super(key: key);
  @override
  _SupervisorsPageState createState() => _SupervisorsPageState();
}

class _SupervisorsPageState extends State<SupervisorsPage> {
  List<String> datas=['abdo','ahmed','Mohammed','nader','ali','assem','amin','dsfsdf','dff','dssfsd'];
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
        title: Text('Admins',style: TextStyle(color: Colors.teal),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),

      body: Column(
        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            crossAxisAlignment: CrossAxisAlignment.end,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: FlatButTopNotif(),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: FlatButTopSendMessage(),
//              ),
//            ],
//          ),

          Expanded(
            child: new StreamBuilder(
                stream: Firestore.instance.collection("admins").where('companyname',isEqualTo:followcompany).snapshots(),
                builder: (context,snapshots){
                  if(!snapshots.hasData){
                    return Center(child: new Text("CONNECTING....."));
                  }
                  return ListView.builder(
                      itemCount:snapshots.data.documents.length,
                      itemBuilder: (context,index){
                        DocumentSnapshot ds=snapshots.data.documents[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.5,horizontal: 3.0),
                          child: Card(
                            color: Colors.teal[600],

                            child: ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Supervisor(user: widget.user,company: followcompany,name:ds['name'] ,phone: ds['phone'],longitude: ds['longitude'],latitude: ds['latitude'],adminid: ds['userid'],)));
                              },

                              title: Text(ds['name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),),
                              trailing: Flatbut(),
                            ),
                          ),
                        );
                      });
            })
          ),
        ],
      ),
    );
  }
  Widget Flatbut(){
    return FlatButton(
      color: Colors.orange,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Text("View",style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 17
      ),),
      onPressed: () {

      },
    );
  }
//  Widget FlatButTopNotif(){
//    return FlatButton(
//      color: Colors.teal[600],
//      textColor: Colors.white,
//      disabledColor: Colors.grey,
//      disabledTextColor: Colors.black,
//      padding: EdgeInsets.all(4.0),
//      splashColor: Colors.teal[800],
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.only(
//            topRight: Radius.circular(15.0),
//            bottomLeft: Radius.circular(15.0),
//          )),
//      child: Text("Notification",style: TextStyle(
//          fontWeight: FontWeight.w600,
//          fontSize: 17
//      ),),
//      onPressed: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context)=> SupervisorNotification()));
//      },
//    );
//  }
//  Widget FlatButTopSendMessage(){
//    return FlatButton(
//      color: Colors.teal[600],
//      textColor: Colors.white,
//      disabledColor: Colors.grey,
//      disabledTextColor: Colors.black,
//      padding: EdgeInsets.all(4.0),
//      splashColor: Colors.teal[800],
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(15.0),
//            bottomRight: Radius.circular(15.0),
//          )),
//      child: Text("Send Message",style: TextStyle(
//          fontWeight: FontWeight.w600,
//          fontSize: 17
//      ),),
//      onPressed: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context)=> MessageM2()));
//      },
//    );
 // }


}
