import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
//
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
      home: const HomePage(),
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
          Expanded(
            child: Center(
                child: Text(
              '0',
              style: const TextStyle(fontSize: 100),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: 'decrement',
                    onPressed: () {},
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                  const Gap(10),
                  FloatingActionButton(
                    heroTag: 'increment',
                    onPressed: () {},
                    child: const Icon(Icons.plus_one),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
