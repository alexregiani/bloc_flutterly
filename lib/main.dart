import 'package:bloc_flutterly/bloc/observer/bloc_observer.dart';
import 'package:bloc_flutterly/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'bloc/counter/counter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(create: (context) => ThemeBloc())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.appTheme == AppTheme.light ? ThemeData.light() : ThemeData.dark(),
          home: MultiBlocListener(
            listeners: [
              BlocListener<ThemeBloc, ThemeState>(
                listener: (context, state) {
                  if (state.appTheme == AppTheme.light) {
                    counter = 200;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Welcome to the LIGHT!'),
                      ),
                    );
                  } else if (state.appTheme == AppTheme.dark) {
                    counter = 1000;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Welcome to the DARK'),
                      ),
                    );
                  }
                },
              ),
              BlocListener<CounterBloc, CounterState>(
                listener: (context, state) {},
              ),
            ],
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('Cubit'),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<CounterBloc, CounterState>(
                        builder: (context, state) {
                          return Expanded(
                            child: Center(
                              child: Text(textScaleFactor: 3, '${state.counter}'),
                            ),
                          );
                        },
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                BlocProvider.of<CounterBloc>(context).add(CounterAddEvent(counter: counter)),
                            child: const Icon(Icons.plus_one),
                          ),
                          const Gap(10),
                          ElevatedButton(
                              onPressed: () => context.read<CounterBloc>().add(CounterSubtractEvent()),
                              child: const Icon(Icons.exposure_minus_1)),
                          const Gap(10),
                          ElevatedButton(
                            onPressed: () => BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent()),
                            child: const Icon(Icons.invert_colors_on),
                          ),
                          const Gap(10),
                          ElevatedButton(
                            onPressed: () => context.read<CounterBloc>().add(CounterResetEvent()),
                            child: const Icon(Icons.delete),
                          ),
                          const Gap(10)
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
