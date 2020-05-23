import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elhajj/hajj/Guide.dart';
import 'package:elhajj/hajj/hajjNotification.dart';
import 'package:elhajj/hajj/supervisor_data.dart';
import 'package:elhajj/hajj/supervisors_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;
import 'package:fluttertoast/fluttertoast.dart';

class HajjHome extends StatefulWidget {

  final FirebaseUser user;

  const HajjHome({Key key, this.user}) : super(key: key);
  @override
  _HajjHomeState createState() => _HajjHomeState();
}

class _HajjHomeState extends State<HajjHome> {
 
  String _location='juhjh';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    String iduser=widget.user.uid;
    String docid;
    Future<QuerySnapshot> docRef=Firestore.instance.collection("user").where('userid',isEqualTo:iduser).getDocuments().then((value){
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
          .collection("user")
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
//      Fluttertoast.showToast(
//          msg: '[motionchange] - $location',
//          toastLength: Toast.LENGTH_SHORT,
////          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
////          backgroundColor: Colors.red,
////          textColor: Colors.white,
//          fontSize: 16.0
//      );
      print('[motionchange] - ${location.coords.latitude.toString()+" | "+location.coords.longitude.toString()}');
    });

    // Fired whenever the state of location-services changes.  Always fired at boot
    bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
//      Fluttertoast.showToast(
//          msg: '[providerchange] - $event',
//          toastLength: Toast.LENGTH_SHORT,
////          gravity: ToastGravity.CENTER,
////          timeInSecForIosWeb: 1,
////          backgroundColor: Colors.red,
////          textColor: Colors.white,
//          fontSize: 16.0
//      );
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
        //title: Text('Home',style: TextStyle(color: Colors.teal),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),

            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width ,
                        child: FlatButTopHajjInformaion()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width ,
                        child: FlatButTopMySupervisor()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width ,
                        child: FlatButTopNotification()),
                  ),
                ],
              )
            ),

          ],
        ),
      ),
    );
  }
  Widget FlatButTopMySupervisor(){
    return FlatButton(

      color: Colors.teal[800],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[600],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )),
      child: Text("My Supervisor",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 35
      ),),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SupervisorsPage(user: widget.user,)));
      },
    );
  }

  Widget FlatButTopHajjInformaion(){
    return FlatButton(

      color: Colors.teal[800],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[600],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )),
      child: Text("Manasik Informaions",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 35
      ),),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> frameGuide()));
      },
    );
  }

  Widget FlatButTopNotification(){
    return FlatButton(

      color: Colors.teal[800],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[600],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )),
      child: Text("Notification",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 35
      ),),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HajjNotification(user: widget.user,)));
      },
    );
  }
}
