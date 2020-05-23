
import 'package:avatar_glow/avatar_glow.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:elhajj/company/service/AuthService.dart';
import 'package:elhajj/hajj/DirectSelect.dart';


import 'package:elhajj/hajj/service/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpHajj2 extends StatefulWidget {
  @override
  _SignUpHajj2State createState() => _SignUpHajj2State();
}

class _SignUpHajj2State extends State<SignUpHajj2> {
  bool _isHidden = true;
  DropDown followcompany=DropDown();
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String _email, _password,_name,_phone,_address,_nationalID;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AuthServiceuser ser=AuthServiceuser();
 var getval;
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
              Form(
                key: _formkey,
                child: Column(
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
                        child: buildTextFieldpass("Password"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                        child: buildTextFieldname("Name",Icon(
                          Icons.person,
                          color: Color(0XFF005B5A),
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                        child: buildTextFieldphone("Phone",Icon(
                          Icons.phone,
                          color: Color(0XFF005B5A),
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                        child: buildTextFieldaddress("Address",Icon(
                          Icons.home,
                          color: Color(0XFF005B5A),
                        ),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
                        child: buildTextFieldnationalid("National ID",Icon(
                          Icons.perm_identity,
                          color: Color(0XFF005B5A),
                        ),),
                      ),
//                      Padding(
//                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4.0),
//                        child: Row(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Text("Company",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.teal[600]),),
//
//                           // DropDown() ,
//                          //DropDown(email: _email,password: _password,name: _name,phone: _phone,address: _address,nationalID: _nationalID,),
//
//                          //adddata(),
//
//                          ],
//
//                        ),
//                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 16.0),
                        child: buildButtonContainer(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                    ]),
              )
            ],
          ),
        ));
  }

  Widget buildTextField(String hintText) {
    return TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'please type an email';
        }
        if(!input.contains('@user.com')){
          return 'please shoud @user.com ';
        }
      },
      onSaved: (input) => _email = input,

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
          prefixIcon: Icon(
            Icons.email,
            color: Color(0XFF005B5A),
          )


      ),
      obscureText: hintText == "Password" ? _isHidden : false,

      //onTap: ()=>emailController.text,
    );
  }
  Widget buildTextFieldpass(String hintText) {
    return TextFormField(
      validator: (input) {
        if (input.length < 6) {
          return 'your password needs to be atleast 6 characters ';
        }
      },
      onSaved: (input) => _password = input,

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
        prefixIcon:
        Icon(
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

      //onTap: ()=>emailController.text,
    );
  }

  Widget buildTextFieldname(String hintText,Icon icon) {
    return TextFormField(
      validator: (input) {
        if (input.length<3) {
          return 'please type an name';
        }

      },
      onSaved: (input) => _name = input,
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
  Widget buildTextFieldphone(String hintText,Icon icon) {
    return TextFormField(
      validator: (input) {
        if (input.length<11) {
          return 'please type an phone';
        }

      },
      onSaved: (input) => _phone = input,
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
  Widget buildTextFieldaddress(String hintText,Icon icon) {
    return TextFormField(
      validator: (input) {
        if (input.length<3) {
          return 'please type an Address';
        }

      },
      onSaved: (input) => _address = input,
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
  Widget buildTextFieldnationalid(String hintText,Icon icon) {
    return TextFormField(
      validator: (input) {
        if (input.length<14) {
          return 'please type an nationalid';
        }

      },
      onSaved: (input) => _nationalID = input,
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
    return GestureDetector(
      onTap: (){
        if (_formkey.currentState.validate()) {
          _formkey.currentState.save();
          print(_email);
          print(_name);
          print(_nationalID);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DropDown(email: _email,password: _password,name: _name,phone: _phone,address: _address,nationalID: _nationalID,)));
        }
      },
      child: Container(
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
            "Contuine",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }


}
