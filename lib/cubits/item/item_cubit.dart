import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/item_request.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitialState());

  void itemCreate() async {
    try {
      print('fetching items');
      final listItems = await ApiNetwork().getItems();
      // print('list items: $listItems');
      emit(const ItemSuccessState(items: []).copyWith(items: listItems));
    } catch (e) {
      print('exception type ${e.runtimeType}');
      if (e is SocketException) {
        print('Socket CUBIT LAYER ${e.toString()}');
        emit(const ItemFailureState(error: 'no internet'));
      } else if (e is TimeoutException) {
        emit(const ItemFailureState(error: 'timeout error'));
      }
    }
  }
}
