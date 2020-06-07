import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:furniassure/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  bool _isLoading = false;

  var http;



  @override

  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));

    return Scaffold(

      body: Container(

        decoration: BoxDecoration(

          gradient: LinearGradient(

              colors: [Colors.yellowAccent, Colors.white],

              begin: Alignment.topCenter,

              end: Alignment.bottomCenter),

        ),

        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(

          children: <Widget>[

            headerSection(),

            textSection(),

            buttonSection(),

          ],

        ),

      ),

    );

  }



  signIn(String email, pass) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map data = {

      'email': email,

      'password': pass

    };

    var jsonResponse = null;

    var response = await http.post("https://taz-cards-against-humanity.herokuapp.com/users", body: data);

    if(response.statusCode == 200) {

      jsonResponse = json.decode(response.body);

      if(jsonResponse != null) {

        setState(() {

          _isLoading = false;

        });

        sharedPreferences.setString("token", jsonResponse['token']);

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);

      }

    }

    else {

      setState(() {

        _isLoading = false;

      });

      print(response.body);

    }

  }



  Container buttonSection() {

    return Container(

      width: MediaQuery.of(context).size.width,

      height: 40.0,

      padding: EdgeInsets.symmetric(horizontal: 15.0),

      margin: EdgeInsets.only(top: 15.0),

      child: RaisedButton(

        onPressed: emailController.text == "" || passwordController.text == "" ? null : () {

          setState(() {

            _isLoading = true;

          });

          signIn(emailController.text, passwordController.text);

        },

        elevation: 0.0,

        color: Colors.white,

        child: Text("Sign In", style: TextStyle(color: Colors.black)),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),

      ),

    );

  }



  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();



  Container textSection() {

    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),

      child: Column(

        children: <Widget>[

          TextFormField(

            controller: emailController,

            cursorColor: Colors.black,



            style: TextStyle(color: Colors.black),

            decoration: InputDecoration(

              icon: Icon(Icons.email, color: Colors.black),

              hintText: "Email",

              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),

              hintStyle: TextStyle(color: Colors.black),

            ),

          ),

          SizedBox(height: 30.0),

          TextFormField(

            controller: passwordController,

            cursorColor: Colors.black,

            obscureText: true,

            style: TextStyle(color: Colors.black),

            decoration: InputDecoration(

              icon: Icon(Icons.lock, color: Colors.black),

              hintText: "Password",

              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),

              hintStyle: TextStyle(color: Colors.black),

            ),

          ),

        ],

      ),

    );

  }



  Container headerSection() {

    return Container(

      margin: EdgeInsets.only(top: 50.0),

      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),

      child: Text("FurniAssure",

          style: TextStyle(

              color: Colors.black,

              fontSize: 40.0,

              fontWeight: FontWeight.bold)),

    );

  }
}

//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//  final GoogleSignIn googleSignIn = new GoogleSignIn();
//  SharedPreferences preferences;
//  bool loading = false;
//  bool isLoggedin = false;
//
//
//  @override
//  void initState() {
//    super.initState();
//    isSignedIn();
//  }
//
//  void isSignedIn() async{
//    setState(() {
//      loading = true;
//    });
//    preferences = await SharedPreferences.getInstance();
//    isLoggedin = await googleSignIn.isSignedIn();
//    if(isLoggedin){
//      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomePage()));
//    }
//    setState(() {
//      loading = false;
//    });
//  }
//
//  Future handleSignIn() async{
//    preferences = await SharedPreferences.getInstance();
//
//    setState(() {
//      loading = true;
//    });
//
//    GoogleSignIn googleUser = (await googleSignIn.signIn()) as GoogleSignIn;
//    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
//
//    Fluttertoast.showToast(msg: "Login was succesful");
//    setState(() {
//      loading = false;
//    });
//  }

//
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
