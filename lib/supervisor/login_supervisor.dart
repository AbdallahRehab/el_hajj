import 'package:avatar_glow/avatar_glow.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:elhajj/supervisor/admin_page.dart';
import 'package:elhajj/supervisor/supervisorNotification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSupervisoer extends StatefulWidget {
  @override
  _LoginSupervisoerState createState() => _LoginSupervisoerState();
}

class _LoginSupervisoerState extends State<LoginSupervisoer> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
                      SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: buildTextField("Email"),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: buildTextFieldpass("Password"),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  Widget buildTextField(String hintText) {
    return TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'please type an email';
        }
        if(!input.contains('@admin.com')){
          return 'please shoud @admin.com ';
        }
      },
      onSaved: (input) => _email = input,
      controller: emailController,
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
      controller: passwordController,
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
        child: InkWell(
          onTap: (){
            signIn();
          },


              //Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminPage())),
          child: Text(
            "LOGIN",
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
  Future<void> signIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AdminPage(
                  user: user.user,
                )));
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
