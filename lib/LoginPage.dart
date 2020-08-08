import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login/Home.dart';
import 'package:login/main.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  String validatePassword(String value) {
    if (value.length < 7)
      return 'Password must be more than 7 charater';
    else
      return null;
  }
  void checkValidate() {
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
      
    Widget loginBtn = Material(  
      borderRadius: BorderRadius.circular(30),
      color: Colors.brown[200],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          checkValidate();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white
            ),
           ),
      ),
    );
     Widget regisBtn = Material(
      
      borderRadius: BorderRadius.circular(30),
      color: Colors.brown[200],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {},
        child: Text("Registration",
            textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white
            ),
           ),
      ),
    );

    return Scaffold(
      body: Form(      
         key: _formKey,
         child: ListView(children: <Widget>[
         Container(      
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpeg"), 
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstIn),
                fit: BoxFit.cover),
            ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    "assets/coffee-bean-icon.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 40
                ),
               TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white),
                      ),
                    ),
                  style: TextStyle(
                    color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email)=>EmailValidator.validate(email)? null:"Invalid email address",
                  onSaved: (String val) {
                    _email = val;
                  },
                ),
                SizedBox(
                  height: 20
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white),
                      ),
                    ), 
                  style: TextStyle(
                    color: Colors.white),   
                  validator: validatePassword,
                  onSaved: (String val) {
                    _password = val;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                loginBtn,
                SizedBox(
                  height: 15,
                ),
                Text("or",
                textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white
                ),
               ),
                SizedBox(
                  height: 15,
                ),
                regisBtn,
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        ])
      ),
    );
  }
}