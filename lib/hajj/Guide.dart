
import 'package:flutter/material.dart';




class frameGuide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Login With Admin'),
        backgroundColor: Colors.white,

        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.teal,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset("assets/icons/logo.png"),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        //color: Theme.of(context).scaffoldBackgroundColor,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: SizedBox(
                  height: 700,
                  child: Image.asset("assets/images/git.jpg"))),


              SizedBox(
                height: 40,
              ),



            ],
          ),
        ),
      ),
    );
  }
}
