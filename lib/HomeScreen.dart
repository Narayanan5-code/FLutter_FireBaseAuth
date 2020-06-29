import 'package:flutter/material.dart';
import 'package:flutter_fireauth/main.dart';

class HomeScreen extends StatelessWidget {

  final name;

  const HomeScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Your login in succesfully",style: getCustom(),),
            SizedBox(height: 40),
            Text("Your name is $name")
          ],
        ),
      ),
    );
  }
}
