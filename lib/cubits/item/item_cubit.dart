import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/item_request.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitialState());

  void cardCreate() async {
    print('fetching items');
    final listItems = await ApiNetwork().getItems();
    // print('list items: $listItems');
    emit(const ItemSuccessState(items: []).copyWith(items: listItems));
  }
}
