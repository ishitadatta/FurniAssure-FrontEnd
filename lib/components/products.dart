import 'package:flutter/material.dart';
import 'package:furniassure/pages/product_details.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  var job_list = [
    {
      "name": "Ikea Couch",
      "picture": "images/Products/couch1.jpg",
      "old_cost": 2000,
      "new_cost": 6000,
    },
    {
      "name": " Double-Bed  ",
      "picture": "images/Products/bed1.jpg",
      "old_cost": 2000,
      "new_cost": 6000,
    },
    {
      "name": "Cabinet Collection",
      "picture": "images/Products/cabinet1.jpg",
      "old_cost": 4000,
      "new_cost": 6000,
    },
    {
      "name": "Dining Table ",
      "picture": "images/Products/table1.jpg",
      "old_cost": 6000,
      "new_cost": 10000,
    },
    {
      "name": "Hometown Chair",
      "picture": "images/Products/chair1.jpg",
      "old_cost": 3000,
      "new_cost": 7000,
    },
    {
      "name": "Living Chair Collection",
      "picture": "images/Products/chair2.jpg",
      "old_cost": 8000,
      "new_cost": 10000,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: job_list.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_job(
            job_name: job_list[index]['name'],
            job_picture: job_list[index]['picture'],
            job_old_cost: job_list[index]['old_cost'],
            job_new_cost: job_list[index]['new_cost'],

          );
        });
  }
}

class Single_job extends StatelessWidget {
  final job_name;
  final job_picture;
  final job_old_cost;
  final job_new_cost;


  Single_job({
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
