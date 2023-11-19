import 'package:bloc_flutterly/presentation/card_item.dart';
import 'package:bloc_flutterly/presentation/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'bloc/item_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ItemBloc(),
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
  void initState() {
    super.initState();
    context.read<ItemBloc>().add(ItemFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Cubit'),
          ),
          body: BlocBuilder<ItemBloc, ItemState>(
            builder: (context, state) {
              if (state is ItemSuccessState) {
                return ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetail(
                                title: state.items[index].title,
                                price: state.items[index].price,
                                description: state.items[index].description,
                                image: state.items[index].image),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          CardItem(
                            title: state.items[index].title,
                            price: state.items[index].price,
                            description: state.items[index].description,
                            image: state.items[index].image,
                          ),
                          const Gap(10)
                        ],
                      ),
                    );
                  },
                );
              } else if (state is ItemFailureState) {
                return Text(state.error);
              } else if (state is ItemInitialState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Text('error');
              }
            },
          )
          // SizedBox(width: 200, height: 270, child: CardItem()),
          ),
    );
  }
}
