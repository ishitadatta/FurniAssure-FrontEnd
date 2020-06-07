import 'package:flutter/material.dart';

class Cart_jobs extends StatefulWidget {
  @override
  _Cart_jobsState createState() => _Cart_jobsState();
}

class _Cart_jobsState extends State<Cart_jobs> {
  var jobs_selected = [
    {
      "name": "Amit Brothers",
      "picture": "images/amitbrothers.jpg",
      "new_cost": 600,
      "age": 36,
      "location":"Banshankari",
      "experience":4,
    },
    {
      "name": "Supriya",
      "picture": "images/supriya.png",
      "new_cost": 600,
      "age": 24,
      "location":"JP Nagar",
      "experience":6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:jobs_selected.length,
        itemBuilder: (context,index){
          return Single_cart_job(
              cart_job_name: jobs_selected[index]["name"],
              cart_job_age: jobs_selected[index]["age"],
              cart_job_location: jobs_selected[index]["location"],
              cart_job_experience: jobs_selected[index]["experience"],
              cart_job_new_cost: jobs_selected[index]["new_cost"],
              cart_job_picture: jobs_selected[index]["picture"]


          );
        });
  }
}

class Single_cart_job extends StatelessWidget {
  final cart_job_name;
  final cart_job_picture;
  final cart_job_new_cost;
  final cart_job_age;
  final cart_job_location;
  final cart_job_experience;

  Single_cart_job({
    this.cart_job_name,
    this.cart_job_picture,
    this.cart_job_new_cost,
    this.cart_job_age,
    this.cart_job_location,
    this.cart_job_experience
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //LEADING SECTION
        leading: Image.asset(cart_job_picture,width:80.0,
          height: 80.0,),

        //TITLE SECTION
        title: Text(cart_job_name),

        //SUBTITLE SECTION
        subtitle: Column(children: <Widget>[
          Row(
            children: <Widget>[
              /*Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("Age:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_job_age,style: TextStyle(color: Colors.purple),),
                ),*/

              Padding(
                padding: const EdgeInsets.fromLTRB(10.0,8.0,8.0,8.0),
                child: Text("Location:"),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(cart_job_location,style: TextStyle(color: Colors.black26)),
              ),
            ],
          ),

          Container(
            alignment: Alignment.topLeft,
            child: Text("\$${cart_job_new_cost}",
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),),
          ),
        ],
        ),
        /*trailing: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
            IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),

          ],),*/
      ),
    );

  }
}