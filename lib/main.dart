import 'package:bloc_flutterly/bloc/observer/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'bloc/color/color_bloc.dart';
import 'bloc/counter/counter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
          create: (context) => ColorBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, state) {
            return BlocListener<ColorBloc, ColorState>(
              listener: (context, state) {
                if (state.color == Colors.red) {
                  incrementSize = 1;
                } else if (state.color == Colors.blue) {
                  incrementSize = 10;
                } else if (state.color == Colors.green) {
                  incrementSize = 100;
                } else {
                  incrementSize = 1;
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
                          onPressed: () => BlocProvider.of<ColorBloc>(context).add(ColorChangeEvent()),
                          child: const Text(style: TextStyle(fontSize: 40), 'Change Color'),
                        ),
                        const Gap(20),
                        BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            return Text(textScaleFactor: 3, '${state.counter}');
                          },
                        ),
                        const Gap(20),
                        ElevatedButton(
                          onPressed: () => BlocProvider.of<CounterBloc>(context).add(CounterChangeEvent(incrementSize)),
                          child: const Text(style: TextStyle(fontSize: 40), 'Increment Counter'),
                        ),
                        const Gap(20),
                        ElevatedButton(
                          onPressed: () => BlocProvider.of<CounterBloc>(context).add(CounterResetEvent()),
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
