import 'package:bloc_flutterly/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'bloc/counter/counter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => const HomePage(),
      '/counter': (context) => const CounterPage(),
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => BlocProvider.of<CounterBloc>(context).add(const CounterChangeEvent()),
              child: const Text('Increment Counter', style: TextStyle(fontSize: 40)),
            ),
            const Gap(10),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                child: const Text(style: TextStyle(fontSize: 40), 'Show me counter'),
              );
            })
          ],
        ),
      ),
    );
  }
}
