import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail(
      {super.key, required this.title, required this.price, required this.description, required this.image});

  final String title;
  final double price;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Flexible(flex: 1, child: Image.network(image)),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(description),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                price.toString(),
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
