import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/theme_cubits/theme_cubit.dart';
import 'cubits/theme_cubits/theme_state.dart';

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
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
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
            // print('random number $randInt');
            BlocProvider.of<ThemeCubit>(context).themeChange(randInt);
          },
          child: const Text(style: TextStyle(fontSize: 30), 'change theme'),
        ),
      ),
    );
  }
}
