
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

TextStyle textStyle = TextStyle(
  fontSize: 40,
);

class LoginSuccessPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SuccessPage();
}

class SuccessPage extends State<LoginSuccessPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text(
            'Login Success',
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}