import 'dart:async';
import 'package:flutter/material.dart';
import 'package:furniassure/Begin.dart';
// import Page 1 of your app here -IMPORTANT

void main()=>runApp(new MaterialApp
  (


  theme:ThemeData(primaryColor:Colors.yellow,
      accentColor:Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  var mainAxisAlignment;

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.5),
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInBack,
        reverseCurve: Curves.easeInBack
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>
        [
          Container
            (
            decoration: BoxDecoration(color:Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>
            [
              Expanded
                (
                  flex: 2,
                  child:Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>
                    [
                      CircleAvatar(backgroundColor: Colors.yellow,
                        radius: 70.0,
                        child: Icon(
                          Icons.assessment,color:Colors.black,size:120,
                        ),
                      ),
                      Padding(padding:EdgeInsets.only(top:10.0),
                      ),

//EDIT APP NAME HERE

                      Text("FurniAssure",
                        style: TextStyle(color: Colors.black,fontSize: 26.0,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                      )
                    ],
                  )
              ),
              Expanded
                (
                flex: 1,
                child: Column
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [

                    //new SizedBox(
                    //width:150.0,height:20.0,
                    Column(children: <Widget>
                    [ Padding(padding: EdgeInsets.only(top:15.0),),
                      RaisedButton(

                        child:Column(children: <Widget>[

                          Text('HEAD IN!',style:TextStyle(color: Colors.black)),

                        ],),color:Colors.yellow , onPressed: () {
                        navfunction(context);
                      },),
//padding between button and circular loader
                      Padding(padding: EdgeInsets.only(top:15.0),),
                      new SizedBox(
                        width:50.0,height:50.0,

                        child: new  CircularProgressIndicator(

                            backgroundColor: Colors.black,
                            valueColor: new AlwaysStoppedAnimation(Colors.yellowAccent)),
                      ),

                      Padding(padding: EdgeInsets.only(top:20.0),),
                      //put padding if you want



                      SlideTransition(
                        position: _offsetAnimation,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                          Text("All of your Furniture Needs!",
                              style:TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight:FontWeight.bold
                              )

                          ),

                        ),
                      ),




                      SizedBox(height: 3.0, width:double.infinity),


                      SlideTransition(
                        position: _offsetAnimation,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                          Text("All in One Place!",
                              style:TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight:FontWeight.bold
                              )

                          ),

                        ),
                      ),

                    ],
                    )

                  ],
                ),
              )

            ],
          )
        ],
      ),

    );

  }
}

Future navfunction(context) async
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => Begin()));
}


//LET PAGE 2 be the first class of your project.  just replace your first class's name with page2
