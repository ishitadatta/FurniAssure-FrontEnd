import 'package:flutter/material.dart';
import 'package:furniassure/pages/home.dart';
import 'cart.dart';

class JobDetails extends StatefulWidget {
  final job_detail_name;
  final job_detail_new_cost;
  final job_detail_old_cost;
  final job_detail_picture;

  JobDetails({
    this.job_detail_name,
    this.job_detail_new_cost,
    this.job_detail_old_cost,
    this.job_detail_picture,
  });

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            },
            child: Text('OddJobFinder')),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),

        ],
      ),


      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.job_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.job_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:16.0),),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text("\$${widget.job_detail_old_cost}",
                            style:TextStyle(color: Colors.grey/*, decoration: TextDecoration.lineThrough*/),)
                      ),

                      Expanded(
                          child: Text("\$${widget.job_detail_new_cost}",style: TextStyle(fontWeight: FontWeight.bold, color:Colors.red),)
                      ),
                    ],
                  ),
                ),
              ),),
          ),

//the first buttons
          Row(
            children: <Widget>[

              //the age button
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("Choose the size"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: Text("close"), )
                            ],

                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Size")),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //the location button
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Colour"),
                            content: Text("Choose the colour"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: Text("close"), )
                            ],

                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Colour")),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //the experience button
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Quanitity"),
                            content: Text("Choose the quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: Text("close"), )
                            ],

                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Quantity")),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

            ],
          ),

//the second buttons
          Row(
            children: <Widget>[
              //the size button
              Expanded(
                child: MaterialButton(onPressed: (){
                  {Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));};

                },
                    color: Colors.yellow,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Buy Now")
                ),
              ),

              new IconButton(icon: Icon(Icons.add_alert, color: Colors.yellow), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border, color: Colors.yellow), onPressed: (){}),

            ],
          ),

          Divider(color: Colors.yellow),
          ListTile(
            title: Text("Product Description"),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product name", style: TextStyle(color: Colors.grey),),),
              Padding(padding:EdgeInsets.all(5.0),
                child: Text(widget.job_detail_name),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Brand", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("English,Telugu,Kannada"),)
            ],
          ),


          Divider(),
          Padding(padding: const EdgeInsets.all(8.0),
            child: Text("You can also purchase: "),
          ),

//    Related Products Section

          Container(
            height: 340.0,
            child: Related_to(),
          )

        ],
      ),
    );
  }
}


class Related_to extends StatefulWidget {
  @override
  _Related_toState createState() => _Related_toState();
}

class _Related_toState extends State<Related_to> {

  var job_list = [
    {
      "name": "Ram",
      "picture": "images/Products/chair1.jpg",
      "old_cost": 200,
      "new_cost": 600,
    },
    {
      "name": " Vamsi brothers",
      "picture": "images/Products/couch1.jpg",
      "old_cost": 200,
      "new_cost": 600,
    },
    {
      "name": "Javed",
      "picture": "images/Products/bed1.jpg",
      "old_cost": 400,
      "new_cost": 600,
    },
    {
      "name": "Harendra Shankar",
      "picture": "images/Products/table1.jpg",
      "old_cost": 600,
      "new_cost": 1000,
    },
    {
      "name": "Arnabi",
      "picture": "images/Products/chair2.jpg",
      "old_cost": 300,
      "new_cost": 700,
    },
    {
      "name": "Suresh",
      "picture": "images/Products/bed1.jpg",
      "old_cost": 800,
      "new_cost": 1000,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: job_list.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return RelatedSingle_job(
            job_name: job_list[index]['name'],
            job_picture: job_list[index]['picture'],
            job_old_cost: job_list[index]['old_cost'],
            job_new_cost: job_list[index]['new_cost'],

          );
        });
  }
}

class RelatedSingle_job extends StatelessWidget {
  final job_name;
  final job_picture;
  final job_old_cost;
  final job_new_cost;


  RelatedSingle_job({
    this.job_name,
    this.job_picture,
    this.job_old_cost,
    this.job_new_cost,

  });
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: ()=> Navigator.of(context).push(
                  new MaterialPageRoute(
                    //here we are passing the values of the job to the job details page
                      builder: (context) => new JobDetails(
                        job_detail_name: job_name,
                        job_detail_new_cost: job_new_cost,
                        job_detail_old_cost: job_old_cost,
                        job_detail_picture: job_picture,

                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,

                      /* child: ListTile(
                      leading: Text(
                        job_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$job_new_cost",
                        style: TextStyle(
                           color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                       subtitle: Text(
                        "\$$job_old_cost",
                        style: TextStyle(
                           color: Colors.black54, fontWeight: FontWeight.w800/*,
                           decoration: TextDecoration.lineThrough*/),
                      ),*/
                      child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(job_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                            ),
                            Text("\$${job_new_cost}", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),)
                          ]
                      )


                  ),

                  child: Image.asset(
                    job_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ));
  }
}
