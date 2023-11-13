import 'package:bloc_flutterly/presentation/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/item/item_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final double pricePlaceholder = 30;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCubit(),
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Cubit'),
            ),
            body: BlocConsumer<ItemCubit, ItemState>(
              listener: (context, state) => ItemCubit(),
              builder: (context, state) {
                if (state is ItemFetchSuccess) {
                  return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      return CardItem(
                        title: state.items[index].title,
                        price: state.items[index].price,
                        description: state.items[index].description,
                        image: state.items[index].image,
                      );
                    },
                  );
                } else if (state is ItemInitial) {
                  return CircularProgressIndicator();
                } else {
                  return Text('error');
                }
              },
            )
            // SizedBox(width: 200, height: 270, child: CardItem()),
            ),
      ),
    );
  }
}
