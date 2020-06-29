import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import './HomeScreen.dart';
import 'main.dart';

class LoginScreen extends StatelessWidget {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future<FirebaseUser> login(String email,String pass) async{
    FirebaseAuth _auth =FirebaseAuth.instance;
    try{
      AuthResult result =await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;

      return user;
    }catch(e){
      print(e);
      return null;
    }


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('LOGIN PAGE',style: getCustom(),),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Please Enter your E-mail Id"
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _passController,
                decoration: InputDecoration(
                    labelText: "Please Enter your Password"
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: FlatButton(
                  child: Text("Login",style: getCustom(),),
                  onPressed: () async{
                    final email = _emailController.text.toString().trim();
                    final pass = _passController.text.toString().trim();

                    FirebaseUser user = await login(email, pass);
                    if(user != null){
                      Navigator.of(context).push(MaterialPageRoute(
                    builder:(context) => HomeScreen(name:user.displayName)
                    ));}
                    else{
                      print('error');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
