import 'package:elhajj/hajj/service/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DropDown extends StatefulWidget {


  final String email,password,name,phone,address,nationalID;

  const DropDown({Key key, this.email, this.password, this.name, this.phone, this.address, this.nationalID}) : super(key: key);

  @override
  DropDownState createState() => DropDownState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'maka'),
      Company(2, 'maka2'),
      Company(3, 'elmadena'),
      Company(4, 'maka3'),
      Company(5, 'LG'),
    ];
  }
}

class DropDownState extends State<DropDown> {
  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  AuthServiceuser ser=AuthServiceuser();
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
        body: new Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Select a company"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                  style: TextStyle(color: Color(0XFFFC9634), fontSize: 22,fontWeight: FontWeight.w900),
                  iconEnabledColor: Color(0XFFFC9634),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedCompany.name}'),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: buildButtonContainer(),
                ),
              ],
            ),
          ),
        ),
      );

  }
  Widget buildButtonContainer() {
    return GestureDetector(
      onTap: (){

        signup();
        return Alert(
            context: context,
            title: "Added Done",
            image: Image.asset("assets/images/success.png"),
            desc: "Welcome to our app")
            .show();


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

    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: widget.email, password: widget.password);

      print(user.user.uid);
      ser.adduser(user,widget.name,widget.phone,widget.address,widget.nationalID,_selectedCompany.name);
    } catch (e) {
      print(e.toString());
    }

  }
}
