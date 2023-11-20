import 'package:bloc_flutterly/cubit/color/color_cubit.dart';
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
    return BlocProvider(
      create: (context) => ColorCubit(),
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
                      const Text(textScaleFactor: 3, 'Counter'),
                      const Gap(20),
                      ElevatedButton(
                        onPressed: () {},
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
