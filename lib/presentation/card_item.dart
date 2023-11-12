import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({required this.title, required this.price, required this.description, required this.image, super.key});

  final String title;
  final double price;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Column(
          children: [
            Image.asset(image),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  price.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
