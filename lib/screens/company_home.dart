import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyHome extends StatefulWidget {
  @override
  _CompanyHomeState createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  List<String> data = [
    'abdo',
    'ahmed',
    'Mohammed',
    'nader',
    'ali',
    'assem',
    'amin',
    'dsfsdf',
    'dff',
    'dssfsd'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  trailing: Container(
                    width: 200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: FlatButApprove(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: FlatbutDelete(),
                          ),
                        ],
                      )),
                ),
              ),
            );
          }),
    );
  }

  Widget FlatbutDelete() {
    return FlatButton(
      color: Colors.deepOrange[500],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Delete",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      ),
      onPressed: () {},
    );
  }

  Widget FlatButApprove() {
    return FlatButton(
      color: Colors.deepOrange[500],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(4.0),
      splashColor: Colors.teal[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Approve",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      ),
      onPressed: () {},
    );
  }


}