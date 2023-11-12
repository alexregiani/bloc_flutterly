part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  const ItemState();
}

class ItemInitial extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemFetchSuccess extends ItemState {
  final List<StoreItem> items;

  const ItemFetchSuccess({required this.items});

  @override
  List<Object> get props => [];
}
