import 'package:bloc_flutterly/cubits/counter/counter_cubit.dart';
import 'package:bloc_flutterly/other_page.dart';
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
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.counter == 4) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Congratulations 3'),
            ),
          );
        } else if (state.counter == -1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtherPage(),
              ));
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.counter}',
                    style: const TextStyle(fontSize: 100),
                  );
                },
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
                      onPressed: context.read<CounterCubit>().decrement,
                      child: const Icon(Icons.exposure_minus_1),
                    ),
                    const Gap(10),
                    FloatingActionButton(
                      heroTag: 'increment',
                      onPressed: BlocProvider.of<CounterCubit>(context).increment,
                      child: const Icon(Icons.plus_one),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
