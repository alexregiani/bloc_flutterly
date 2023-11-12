import 'package:bloc_flutterly/presentation/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/item/item_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCubit(),
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Cubit'),
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardItem();
              },
            )
            // SizedBox(width: 200, height: 270, child: CardItem()),
            ),
      ),
    );
  }
}
