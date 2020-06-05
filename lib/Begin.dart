import 'package:flutter/material.dart';
import 'package:furniassure/pages/home.dart';


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
                                color: Colors.yellow[100],
                                textColor: Colors.black,
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
