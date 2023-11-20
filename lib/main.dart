import 'package:bloc_flutterly/cubit/color/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'cubit/counter/counter_cubit.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            return BlocListener<ColorCubit, ColorState>(
              listener: (context, state) {
                if (state.color == Colors.red) {
                  incrementSize = 1;
                } else if (state.color == Colors.blue) {
                  incrementSize = 10;
                } else if (state.color == Colors.green) {
                  incrementSize = 100;
                }
              },
              child: Scaffold(
                  backgroundColor: state.color,
                  appBar: AppBar(
                    title: const Text('Cubit'),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ColorCubit>(context).colorChange();
                          },
                          child: const Text(style: TextStyle(fontSize: 40), 'Change Color'),
                        ),
                        const Gap(20),
                        BlocBuilder<CounterCubit, CounterState>(
                          builder: (context, state) {
                            return Text(textScaleFactor: 3, '${state.counter}');
                          },
                        ),
                        const Gap(20),
                        ElevatedButton(
                          onPressed: () => BlocProvider.of<CounterCubit>(context).counterIncrease(incrementSize),
                          child: const Text(style: TextStyle(fontSize: 40), 'Increment Counter'),
                        ),
                        const Gap(20),
                        ElevatedButton(
                          onPressed: () => context.read<CounterCubit>().reset(),
                          child: const Text('reset'),
                        )
                      ],
                    ),
                  ) // SizedBox(width: 200, height: 270, child: CardItem()),
                  ),
            );
          },
        ),
      ),
    );
  }
}
