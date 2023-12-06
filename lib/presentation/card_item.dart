import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardItem extends StatelessWidget {
  const CardItem({required this.title, required this.price, required this.description, required this.image, super.key});

  final String title;
  final double price;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.network(image),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                description,
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  price.toString(),
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}