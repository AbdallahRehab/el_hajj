import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elhajj/supervisor/message2.dart';
import 'package:elhajj/supervisor/supervisorNotification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;
import 'hajj_data_admin.dart';

class AdminPage extends StatefulWidget {
  final FirebaseUser user;

  const AdminPage({Key key, this.user}) : super(key: key);
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<String> datas=['abdo','ahmed','Mohammed','nader','ali','assem','amin','dsfsdf','dff','dssfsd'];
    String id;

  String _location;
  @override
  Widget build(BuildContext context) {
    String iduser=widget.user.uid;
    Future<QuerySnapshot> getData=Firestore.instance.collection("admins").where('userid',isEqualTo:iduser).getDocuments()
    .then((value){
      value.documents.forEach((result){
        id=result.data['companyname'];
        print(id);
        print(result.data['companyname']);
      });
    });

    String docid;
    Future<QuerySnapshot> docRef=Firestore.instance.collection("admins").where('userid',isEqualTo:iduser).getDocuments().then((value){
      value.documents.forEach((result){
        docid=result.documentID;
      });
    });
    //String ds=docRef.documentID;
    // print(ds);

    bg.BackgroundGeolocation.onLocation((bg.Location location) {
      setState(() {
        _location=location.coords.latitude.toString()+" | "+location.coords.longitude.toString();
      });
      Firestore.instance
          .collection("admins")
          .document(docid)
          .updateData({"latitude": location.coords.latitude,"longitude":location.coords.longitude}).then((_) {
        print("success!");
      });
      print(location.coords.latitude);
      Fluttertoast.showToast(
          msg: '[location] - $location',
          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIosWeb: 1,
//          backgroundColor: Colors.red,
//          textColor: Colors.white,
          fontSize: 16.0
      );
      print('[location] - ${location.coords.latitude.toString()+" | "+location.coords.longitude.toString()}');
    });

    // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
    bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
      setState(() {
        _location=location.coords.latitude.toString()+" | "+location.coords.longitude.toString();
      });
      Fluttertoast.showToast(
          msg: '[motionchange] - $location',
          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIosWeb: 1,
//          backgroundColor: Colors.red,
//          textColor: Colors.white,
          fontSize: 16.0
      );
      print('[motionchange] - ${location.coords.latitude.toString()+" | "+location.coords.longitude.toString()}');
    });

    // Fired whenever the state of location-services changes.  Always fired at boot
    bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
      Fluttertoast.showToast(
          msg: '[providerchange] - $event',
          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIosWeb: 1,
//          backgroundColor: Colors.red,
//          textColor: Colors.white,
          fontSize: 16.0
      );
      //print('[providerchange] - $event');
    });

    ////
    // 2.  Configure the plugin
    //
    bg.BackgroundGeolocation.ready(bg.Config(
        notification: bg.Notification(
            title: "Name app",
            text: "ubicaction activa"
        ),
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 10.0,
        stopOnTerminate: true,
        startOnBoot: true,
        debug: true,
        logLevel: bg.Config.LOG_LEVEL_VERBOSE
    )).then((bg.State state) {
      if (!state.enabled) {
        ////
        // 3.  Start the plugin.
        //
        bg.BackgroundGeolocation.start();
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Users',style: TextStyle(color: Colors.teal),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),

      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButTopNotif(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButTopSendMessage(),
              ),
            ],
          ),

          Expanded(
            child: new StreamBuilder(
                stream: Firestore.instance.collection("user").where('followcompany',isEqualTo:id).snapshots(),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> HajjDataAdmin(name:ds['name'] ,phone: ds['phone'],nid: ds['nationalid'],latitude: ds['latitude'],longitude: ds['longitude'],)));
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
  Widget FlatButTopNotif(){
    return FlatButton(
      color: Colors.teal[600],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )),
      child: Text("Notification",style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17
      ),),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SupervisorNotification(user: widget.user,)));
      },
    );
  }
  Widget FlatButTopSendMessage(){
    return FlatButton(
      color: Colors.teal[600],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )),
      child: Text("Send Message",style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17
      ),),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MessageM2(user: widget.user,company: id ,)));
      },
    );
  }
}
