import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CompanyData extends StatefulWidget {
  final String name,phone,address,docid;

  const CompanyData({Key key, this.name, this.phone, this.address, this.docid}) : super(key: key);
  @override
  _CompanyDataState createState() => _CompanyDataState();
}

class _CompanyDataState extends State<CompanyData> {
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
                      "Company Data",
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
                                  "C_Name : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: 23,
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
                                  "C_Phone : ",
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
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "C_address : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  widget.address,
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
                                    child: Text("Approve",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),

                                  onPressed: () {
                                    //showSnackBar("FlatButton with Color & Shape");
                                    return Alert(
                                      context: context,
                                      title: "Approve Done",
                                      image: Image.asset("assets/images/success.png"),
                                    )
                                        .show();
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
                                  child: Text("Delete",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),),

                                  onPressed: () {
                                    //showSnackBar("FlatButton with Color & Shape");
                                    Firestore.instance.collection("companies").document(widget.docid).delete();

                                    return Alert(
                                      context: context,
                                      title: "Delete Done",
                                      image: Image.asset("assets/images/delete.png"),
                                    )
                                        .show();
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
}
