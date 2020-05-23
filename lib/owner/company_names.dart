import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elhajj/company/hajj_data_com.dart';
import 'package:elhajj/owner/company_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyNames extends StatefulWidget {
  final FirebaseUser user;

  const CompanyNames({Key key, this.user}) : super(key: key);


  @override
  _CompanyNamesState createState() => _CompanyNamesState();
}

class _CompanyNamesState extends State<CompanyNames> {
  List<String> datas = [
    'asas',
    'aassssss',
    'Mohamddd',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Company Names",style: TextStyle(color: Colors.teal),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: new StreamBuilder(
          stream: Firestore.instance.collection("companies").snapshots(),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CompanyData(name: ds['name'],phone: ds['phone'],address: ds['address'],docid: ds.documentID,)));
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

  Widget FlatbutDelete(String documentID) {
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
        Firestore.instance.collection("companies").document(documentID).delete();
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
