import 'package:elhajj/supervisor/admin_page.dart';
import 'package:elhajj/screens/home.dart';
import 'package:elhajj/hajj/login_hajj.dart';
import 'package:elhajj/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
