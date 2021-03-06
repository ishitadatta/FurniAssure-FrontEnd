import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:furniassure/pages/cart.dart';
import 'package:furniassure/components/horizontal_listview.dart';
import 'package:furniassure/components/products.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      color: Colors.yellow,
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/b1.jpg'),
          AssetImage('images/b2.jpeg'),
          AssetImage('images/b3.jpeg'),
          AssetImage('images/b4.jpeg'),
          AssetImage('images/b5.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 3.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('FurniAssure'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
              }),
          IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              })
        ],
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Ishita'),
                accountEmail: Text('isheeta50@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.yellow
                ),
              ),

              //body

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('HomePage'),
                  leading: Icon(Icons.home, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('MyAccount'),
                  leading: Icon(Icons.person, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Past purchases'),
                  leading: Icon(Icons.accessibility, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: ListTile(
                  title: Text('Cart'),
                  leading: Icon(Icons.shopping_cart, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Favourites'),
                  leading: Icon(Icons.favorite, color: Colors.red),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings,color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.help, color: Colors.green),
                ),
              ),
            ],
          )),
      body: ListView(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          //padding widget
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),

          //Horizontal ListView begins here
          HorizontalList(),

          //padding widget
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Recently hired'),
          ),

          //grid view
          Container(
            height: 320.0,
            child: Jobs(),
          )
        ],
      ),
    );
  }
}