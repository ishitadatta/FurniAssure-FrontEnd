import 'package:flutter/material.dart';
//my imports

import 'package:furniassure/components/cart_products.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Item Cart'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),

        ],
      ),

      body: Cart_jobs(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("Total:"),
              subtitle: Text("\$230"),
            )),

            Expanded(
              child: MaterialButton(onPressed: (){},
                child: Text("Check out", style: TextStyle(color: Colors.white),),
                color: Colors.black,),
            )
          ],
        ),
      ),
    );
  }
}