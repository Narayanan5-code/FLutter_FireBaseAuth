import 'main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fireauth/main.dart';
import 'dart:async';

import 'LoginScreen.dart';
class RegistrationScreen extends StatelessWidget {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  Future<bool> registerUser(String email,String pass,String name) async{

    FirebaseAuth _auth = FirebaseAuth.instance;

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user =result.user;

      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;

      user.updateProfile(info);
      return true;
    }catch(e){
      print(e);
          return false;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Registration Process',style: getCustom()),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          color:Colors.amber,
          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Text("REGISTRATION",style:getCustom())),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "E-mail"),
                  controller:_emailController,
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Password"),
                  controller:_passwordController,
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "username"),
                  controller:_usernameController,
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: FlatButton(
                    child: Text("REGISTER",style: getCustom()),
                    textColor: Colors.black,
                    onPressed: () async{
                      final email = _emailController.text.toString().trim();
                      final pass = _passwordController.text.toString().trim();
                      final name = _usernameController.text.toString().trim();

                      bool result = await registerUser(email, pass, name);

                      if(result=true){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                      }else{
                        print('error');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



