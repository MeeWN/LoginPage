import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
   @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: ListView(children: <Widget>[
         Center(
           child: Text("Welcome",
              style: TextStyle(
                fontSize: 40,
              ),),
         )
        ]
       ),
     );

  }
}