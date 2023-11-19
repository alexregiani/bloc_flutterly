part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class ItemFetchEvent extends ItemEvent {
  @override
  List<Object> get props => [];
}
