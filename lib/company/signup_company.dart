import 'package:avatar_glow/avatar_glow.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:elhajj/company/service/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpCompany extends StatefulWidget {
  @override
  _SignUpCompanyState createState() => _SignUpCompanyState();
}

class _SignUpCompanyState extends State<SignUpCompany> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  String _email, _password,_Comname,_phone,_address,_nationalID;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AuthService ser=AuthService();
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4.0),
                        child: buildTextField("Email"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4.0),
                        child: buildTextFieldpass("Password"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4.0),
                        child: buildTextFieldComName(
                          "Company Name",
                          Icon(
                            Icons.person,
                            color: Color(0XFF005B5A),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4.0),
                        child: buildTextFieldphone(
                          "Phone",
                          Icon(
                            Icons.phone,
                            color: Color(0XFF005B5A),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4.0),
                        child: buildTextFieldaddress(
                          "Address",
                          Icon(
                            Icons.home,
                            color: Color(0XFF005B5A),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 16.0),
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
        if(!input.contains('@company.com')){
          return 'please shoud @company.com ';
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

  Widget buildTextFieldComName(String hintText,Icon icon) {
    return TextFormField(
      validator: (input) {
        if (input.length<3) {
          return 'please type an name';
        }

      },
      onSaved: (input) => _Comname = input,
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


  Widget buildButtonContainer() {
    return GestureDetector(
      onTap: () {
        if (_formkey.currentState.validate()) {
        signup();
        return Alert(
                context: context,
                title: "Added Done",
                image: Image.asset("assets/images/success.png"),
                desc: "Welcome to our app")
            .show();
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
            "Submit",
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
  AuthResult  user;
  Future<void> signup() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);

        print(user.user.uid);
        ser.addcompany(user,_Comname,_phone,_address);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
