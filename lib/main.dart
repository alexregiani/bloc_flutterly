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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
            theme: state.darkMode ? ThemeData.dark() : ThemeData.light(),
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
                          return Expanded(child: Center(child: Text(textScaleFactor: 3, '${state.counter}')));
                        },
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () => BlocProvider.of<CounterBloc>(context).add(const CounterAddEvent()),
                            child: const Icon(Icons.plus_one),
                          ),
                          const Gap(10),
                          ElevatedButton(
                              onPressed: () => context.read<CounterBloc>().add(CounterSubtractEvent()),
                              child: const Icon(Icons.exposure_minus_1)),
                          const Gap(10),
                          ElevatedButton(
                            onPressed: () => BlocProvider.of<ThemeBloc>(context).add(DarkThemeSwitchEvent()),
                            child: const Text('dark theme'),
                          ),
                          Gap(10),
                          ElevatedButton(
                            onPressed: () => BlocProvider.of<ThemeBloc>(context).add(LightThemeSwitchEvent()),
                            child: const Text('light theme'),
                          ),
                          const Gap(10),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   child: const Icon(Icons.delete_forever_rounded),
                          // )
                        ],
                      ),
                    ],
                  ),
                ) // SizedBox(width: 200, height: 270, child: CardItem()),
                ));
      },
    );
  }
}
