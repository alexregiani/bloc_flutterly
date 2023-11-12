import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Column(
          children: [
            Image.asset('assets/images/pc.png'),
            const Text(style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), 'Product name'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  'descrition asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), '13,99'),
              ),
            ),
          ],
        ));
  }
}
