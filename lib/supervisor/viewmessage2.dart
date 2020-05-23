import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewMessage2 extends StatefulWidget {
  final String name,message;

  const ViewMessage2({Key key, this.name, this.message}) : super(key: key);
  @override
  _ViewMessage2State createState() => _ViewMessage2State();
}

class _ViewMessage2State extends State<ViewMessage2> {
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
                      "From : ${widget.name}",
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
                      topRight: Radius.circular(200),
                      topLeft: Radius.circular(200),
                    ),
                    child: Center(
                      child: Container(
                        color: Colors.teal[600],
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
                                        maxLines: 8,
                                        enabled: false,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        decoration: InputDecoration.collapsed(
                                            hintText: "this message from ${widget.name} : ${widget.message} "),
                                      ),
                                    ))),

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
