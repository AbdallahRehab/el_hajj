import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elhajj/hajj/service/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class MessageM extends StatefulWidget {
  final FirebaseUser user;
  final String company,adminid;
  const MessageM({Key key, this.user, this.company, this.adminid}) : super(key: key);
  @override
  _MessageMState createState() => _MessageMState();
}

class _MessageMState extends State<MessageM> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String name;
  TextEditingController messageController = new TextEditingController();
  AuthServiceuser ser=AuthServiceuser();
  @override
  Widget build(BuildContext context) {

    String iduser=widget.user.uid;
    Future<QuerySnapshot> getData=Firestore.instance.collection("user").where('userid',isEqualTo:iduser).getDocuments()
        .then((value){
      value.documents.forEach((result){
        name=result.data['name'];
        print(name);
        print(result.data['name']);
      });
    });
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
                      "Message",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                          color: Colors.teal[600]),
                    )),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                    child: Container(
                      color: Colors.teal[600],
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: TextField(
                                        controller: messageController,
                                        maxLines: 8,
                                        style: TextStyle(

                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        decoration: InputDecoration.collapsed(
                                            hintText: "Enter your text here"),
                                      ),
                                    ))),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  FlatButton(
                                    color: Colors.orange[400],
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.teal[500],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      "Massage",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      //showSnackBar("FlatButton with Color & Shape");
                                      String message=messageController.text;
                                     ser.addnewmessage(widget.user, name, widget.company, message,widget.adminid);
                                      return Alert(
                                          context: context,
                                          title: "Send",
                                          image: Image.asset("assets/images/success.png"),
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
                  ),
                )
              ],
            ),
//            Positioned(
//              top: (MediaQuery.of(context).size.height / 3) - 70,
//              left: (MediaQuery.of(context).size.width / 2) - 70,
//              child: Container(
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  border: Border(
//                    right: BorderSide(color: Colors.teal[600],width: 5),
//                    top: BorderSide(color: Colors.teal[600],width: 5),
//                    bottom: BorderSide(color: Colors.teal[600],width: 5),
//                    left: BorderSide(color: Colors.teal[600],width: 5),
//                  ),
//                  borderRadius: BorderRadius.all(Radius.circular(100))
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.all(Radius.circular(50)),
//                    child: Image(
//                      image: AssetImage('assets/icons/logo.png'),
//                      width: 120,
//                      height: 120,
//                    ),
//                  ),
//                ),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
