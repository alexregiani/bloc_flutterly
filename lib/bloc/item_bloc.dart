import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/item_request.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitialState()) {
    on<ItemFetchEvent>((event, emit) async {
      try {
        final listItem = await ApiNetwork().getItems();
        emit(const ItemSuccessState(items: []).copyWith(items: listItem));
      } catch (e) {
        if (e is CustomException) {
          emit(ItemFailureState(error: '$e'));
        }
      }
    });
  }
}
