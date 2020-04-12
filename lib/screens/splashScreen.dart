import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        //navigateAfterSeconds: new TabPage(),
        title: Text('We Help Organize the Hajj \nProcess,so be a part of us.',
          style: new TextStyle(
              fontWeight: FontWeight.w900,

              fontSize: 19.0,
            color: Color(0XFF005B5A),
          ),),
        image: new Image.asset("assets/icons/logo.png"),
        backgroundColor: Colors.white,
        loadingText: Text("Loading ...",
        style: TextStyle(color: Color(0XFF005B5A),fontWeight: FontWeight.w600),),
        photoSize: 125.0,
      loaderColor: Colors.transparent,

    );
  }
}
