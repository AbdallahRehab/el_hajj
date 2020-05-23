import 'package:elhajj/hajj/message1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class Supervisor extends StatefulWidget {
  final FirebaseUser user;
  final String name,phone,company,adminid;
  final  latitude,longitude;
  const Supervisor({Key key, this.name, this.phone, this.latitude, this.longitude, this.user, this.company, this.adminid}) : super(key: key);
  @override
  _SupervisorState createState() => _SupervisorState();
}

class _SupervisorState extends State<Supervisor> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                        child: Text(
                      "Supervisor Data",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 42,color: Colors.teal[600] ),
                    )),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    child: Container(
                      color: Colors.teal[600],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Supervisor  Name : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Supervisor  Phone : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  widget.phone,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.orange[400],
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.teal[500],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                    child: Text("Massage",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),

                                  onPressed: () {
                                    //showSnackBar("FlatButton with Color & Shape");
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MessageM(user: widget.user,company: widget.company,adminid: widget.adminid,)));
                                  },
                                ),
                                FlatButton(
                                  color: Colors.orange[400],
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.teal[500],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text("Location",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),

                                  onPressed: () {
                                    //showSnackBar("FlatButton with Color & Shape");
                                    openMapsSheet(context,double.parse(widget.longitude),double.parse(widget.longitude) );
                                    setState(() {
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height / 3) - 70,
              left: (MediaQuery.of(context).size.width / 2) - 70,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(color: Colors.teal[600],width: 5),
                    top: BorderSide(color: Colors.teal[600],width: 5),
                    bottom: BorderSide(color: Colors.teal[600],width: 5),
                    left: BorderSide(color: Colors.teal[600],width: 5),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image(
                      image: AssetImage('assets/icons/logo.png'),
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  openMapsSheet(context, double latitude,double longitude) async {
    try {
      //final title = "Shibīn al Kawm";
      //final description = "Asia's tallest building";
      //var hospital=hosptail;
      //final coords = hosptail.coords[1];
      final coords = Coords(latitude, longitude);



      print('hhhhhhhhh ${coords.longitude}');

      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () =>
                            map.showMarker(
                              coords: coords,

                              //title: title,
                              //description: description,
                            ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
