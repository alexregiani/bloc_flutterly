import 'package:bloc_flutterly/bloc/observer/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'bloc/counter/counter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => CounterBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Cubit'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Text(textScaleFactor: 3, '${state.counter}');
                    },
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () => BlocProvider.of<CounterBloc>(context).add(const CounterAddEvent()),
                    child: Icon(Icons.plus_one),
                  ),
                  ElevatedButton(
                      onPressed: () => context.read<CounterBloc>().add(CounterSubtractEvent()),
                      child: const Icon(Icons.exposure_minus_1))
                ],
              ),
            ) // SizedBox(width: 200, height: 270, child: CardItem()),
            ));
  }
}
