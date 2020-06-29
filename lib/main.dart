import 'package:flutter/material.dart';
import './RegistrationScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase signing',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: RegistrationScreen(),
    );
  }
}

TextStyle getCustom() {
  return TextStyle(
    fontFamily: 'Permanent_Marker',
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.blueGrey
  );
}