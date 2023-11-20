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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
        BlocProvider(create: (context) => CounterCubit(colorCubit: context.read<ColorCubit>(), incrementSize: 1)),
      ],
      child: MaterialApp(
        home: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            return Scaffold(
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
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).counterIncrease();
                        },
                        child: const Text(style: TextStyle(fontSize: 40), 'Increment Counter'),
                      )
                    ],
                  ),
                ) // SizedBox(width: 200, height: 270, child: CardItem()),
                );
          },
        ),
      ),
    );
  }
}
