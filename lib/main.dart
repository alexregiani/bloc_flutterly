import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
                child: Text(
              '0',
              style: TextStyle(fontSize: 50),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  FloatingActionButton(onPressed: null),
                  Gap(10),
                  FloatingActionButton(onPressed: null),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
