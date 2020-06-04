import 'package:flutter/material.dart';
import 'homepage.dart';


class Begin extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner=false,
        home:Scaffold(
            backgroundColor: Colors.purple,
            body:SafeArea(
                child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:<Widget>[
                      Text('Would You Like To',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color :Colors.white,
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
                                color: Colors.purple[100],
                                textColor: Colors.purple,
                                elevation: 0.2,
                                child: Text("Hire a service")
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
