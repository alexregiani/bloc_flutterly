import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/pc.png'),
        const Text(style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), 'Product Name'),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
              'asdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasdaasdasdasdasdasdasdasdasdasdasdasda'),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Text(style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), '13,99')),
        )
      ],
    );
  }
}
