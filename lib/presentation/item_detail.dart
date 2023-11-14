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
    return Column(
      children: [
        Image.network(image),
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(description),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              price.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
