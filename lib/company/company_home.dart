import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elhajj/company/hajj_data_com.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyHome extends StatefulWidget {
  @override
  _CompanyHomeState createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  List<String> datas = [
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
      body: new StreamBuilder(
          stream: Firestore.instance.collection("user").snapshots(),
          builder: (context,snapshots){
            if(!snapshots.hasData){
              return Center(child: new Text("CONNECTING....."));
            }
            return ListView.builder(
                itemCount: snapshots.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds=snapshots.data.documents[index];
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 0.5, horizontal: 3.0),
                    child: Card(
                      color: Colors.teal[600],
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> HajjDataCom(name: ds['name'],phone: ds['phone'],nid: ds['nationalid'],docid: ds.documentID,)));
                        },
                        title: Text(
                          ds['name'],
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
//                          Padding(
//                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
//                            child: FlatButApprove(),
//                          ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: FlatbutDelete(ds.documentID),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                });

          }),
    );
  }

  Widget FlatbutDelete(String docsid) {
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
      onPressed: () {
        Firestore.instance.collection("user").document(docsid).delete();
      },
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
