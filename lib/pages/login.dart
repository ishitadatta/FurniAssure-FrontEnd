import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:furniassure/pages/home.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;


  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async{
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLoggedin = await googleSignIn.isSignedIn();
    if(isLoggedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
