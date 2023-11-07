import 'package:bloc_flutterly/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        home: HomePage(),
      ),
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
              '${BlocProvider.of<CounterCubit>(context).state.counter}',
              style: const TextStyle(fontSize: 50),
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
                    onPressed: BlocProvider.of<CounterCubit>(context).decrement,
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                  const Gap(10),
                  FloatingActionButton(
                    onPressed: BlocProvider.of<CounterCubit>(context).increment,
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
