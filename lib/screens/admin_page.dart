import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<String> data=['abdo','ahmed','Mohammed','nader','ali','assem','amin','dsfsdf','dff','dssfsd'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.5,horizontal: 3.0),
                    child: Card(
                      color: Colors.teal[600],

                      child: ListTile(
                        onTap: (){
                          print(data[index]);
                        },

                        title: Text(data[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                        trailing: Flatbut(),
                      ),
                    ),
                  );
                }),
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

      },
    );
  }
}
