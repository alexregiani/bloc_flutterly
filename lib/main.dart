import 'dart:math';

import 'package:bloc_flutterly/blocs/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/theme_bloc/theme_state.dart';

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
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeType == ThemeType.light ? ThemeData.light() : ThemeData.dark(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('change theme app'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print('random number $randInt');
            BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(randInt: randInt));
          },
          child: const Text(style: TextStyle(fontSize: 30), 'change theme'),
        ),
      ),
    );
  }
}
