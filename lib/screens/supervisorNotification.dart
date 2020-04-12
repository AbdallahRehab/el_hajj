import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupervisorNotification extends StatefulWidget {
  @override
  _SupervisorNotificationState createState() => _SupervisorNotificationState();
}

class _SupervisorNotificationState extends State<SupervisorNotification> {
  List<String> data = [
    'Message',
    'Message',
    'Message',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: Text('Message Panal',style: TextStyle(
            color: Colors.teal[600],
            fontSize:22,
            fontWeight: FontWeight.w600
          ),),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.5, horizontal: 3.0),
              child: Card(
                color: Colors.teal[600],
                child: ListTile(
                  onTap: () {
                    print(data[index]);
                  },
                  title: Text(
                    data[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Flatbut(),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget Flatbut() {
    return FlatButton(
      color: Colors.deepOrange[500],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        "View",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      ),
      onPressed: () {},
    );
  }
}
