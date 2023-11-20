import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Cubit Communication'),
          ),
          body: Center(child: Placeholder()) // SizedBox(width: 200, height: 270, child: CardItem()),
          ),
    );
  }
}
