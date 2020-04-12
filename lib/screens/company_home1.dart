import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyHome1 extends StatefulWidget {
  @override
  _CompanyHome1State createState() => _CompanyHome1State();
}

class _CompanyHome1State extends State<CompanyHome1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'This Service Enables you to add a supervisor and confirm the acceptance of pilgrims',
                style: TextStyle(fontWeight: FontWeight.w600,
                fontSize: 20,
                 color: Colors.teal[600]),
              ),
            ),
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
                      child: FlatButTopAddSupervisor()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width ,
                      child: FlatButTopConfirmHajj()),
                ),
              ],
            )
          ),

        ],
      ),
    );
  }
  Widget FlatButTopAddSupervisor(){
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
      child: Text("Add Supervisor",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 35
      ),),
      onPressed: () {

      },
    );
  }

  Widget FlatButTopConfirmHajj(){
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
      child: Text("Confirm Hajj",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 35
      ),),
      onPressed: () {

      },
    );
  }
}
