import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HajjHome extends StatefulWidget {
  @override
  _HajjHomeState createState() => _HajjHomeState();
}

class _HajjHomeState extends State<HajjHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
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
      child: Text("Hajj Informaions",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 35
      ),),
      onPressed: () {

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

      },
    );
  }
}
