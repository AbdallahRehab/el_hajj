import 'package:avatar_glow/avatar_glow.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpHajj3 extends StatefulWidget {
  @override
  _SignUpHajj3State createState() => _SignUpHajj3State();
}

class _SignUpHajj3State extends State<SignUpHajj3> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AvatarGlow(
                          startDelay: Duration(milliseconds: 1000),
                          glowColor: Color(0XFF005B5A),
                          endRadius: 90.0,
                          duration: Duration(milliseconds: 2000),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(milliseconds: 100),
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/icons/logo.png',
                                height: 120,
                              ),

                              //shape: BoxShape.circle
                            ),
                          ),
                          shape: BoxShape.circle,
                          animate: true,
                          curve: Curves.fastOutSlowIn,
                        )
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                      child: buildTextField("Email"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                      child: buildTextField("Password"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                      child: buildOtherTextField("Company Name",Icon(
                        Icons.person,
                        color: Color(0XFF005B5A),
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                      child: buildOtherTextField("Phone",Icon(
                        Icons.phone,
                        color: Color(0XFF005B5A),
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                      child: buildOtherTextField("Address",Icon(
                        Icons.home,
                        color: Color(0XFF005B5A),
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 16.0),
                      child: buildButtonContainer(),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                  ])
            ],
          ),
        ));
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
            color: Color(0XFF005B5A),
            fontSize: 20.0,
            fontWeight: FontWeight.w600),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30)
          ),
        ),
        prefixIcon: hintText == "Email"
            ? Icon(
                Icons.email,
                color: Color(0XFF005B5A),
              )
            : Icon(
                Icons.lock,
                color: Color(0XFF005B5A),
              ),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(
                        Icons.visibility_off,
                        color: Color(0XFF005B5A),
                      )
                    : Icon(
                        Icons.visibility,
                        color: Color(0XFF005B5A),
                      ),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildOtherTextField(String hintText,Icon icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
            color: Color(0XFF005B5A),
            fontSize: 20.0,
            fontWeight: FontWeight.w600),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)
          ),
        ),
        prefixIcon: icon


      ),

    );
  }
  Widget buildButtonContainer() {
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        gradient: LinearGradient(
            colors: [Color(0XFF005B5A), Color(0XFF005B5A)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Center(
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
