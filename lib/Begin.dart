import 'package:flutter/material.dart';
import 'package:furniassure/pages/home.dart';
import 'package:furniassure/pages/login.dart';


class Begin extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner=false,
        home:Scaffold(
            backgroundColor: Colors.yellow,
            body:SafeArea(
                child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:<Widget>[
                      Text('Would You Like To',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color :Colors.black,
                          fontFamily: 'Pacifico',
                        ),
                      ),


                      Row(
                        children: <Widget>[
                          //the size button
                          Expanded(
                            child: MaterialButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                            },
                                color: Colors.yellow[100],
                                textColor: Colors.black,
                                elevation: 0.2,
                                child: Text("Sign Up")
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          //the size button
                          Expanded(
                            child: MaterialButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                            },
                                color: Colors.yellow[100],
                                textColor: Colors.black,
                                elevation: 0.2,
                                child: Text("Log In")
                            ),
                          ),
                        ],
                      ),


                    ]
                )
            )
        )
    );
  }
}
