import 'package:flutter/material.dart';


class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220.0,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Category(
            image_location: 'images/Category/couch.jpg',
            image_caption: 'Couch',
          ),
          Category(
            image_location: 'images/Category/bed.jpg',
            image_caption: 'Bed',
          ),
          Category(
            image_location: 'images/Category/table.jpg',
            image_caption: 'Table',
          ),
          Category(
            image_location: 'images/Category/cabinet.jpg',
            image_caption: 'Cabinet',
          ),
          Category(
            image_location: 'images/Category/chair.jxr',
            image_caption: 'Chair',
          ),
          Category(
            image_location: 'images/Category/closet.png',
            image_caption: 'Closet',
          ),
        ]));
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 300.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 170.0,
                height: 170.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: TextStyle(fontSize: 20.0),
                ),
              )),
        ),
      ),
    );
  }
}
