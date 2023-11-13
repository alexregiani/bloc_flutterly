part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitialState extends ItemState {}

class ItemSuccessState extends ItemState {
  final List<StoreItem> items;

  const ItemSuccessState({required this.items});

  @override
  List<Object> get props => [items];

  ItemSuccessState copyWith({
    List<StoreItem>? items,
  }) {
    return ItemSuccessState(
      items: items ?? this.items,
    );
  }
}

class ItemFailureState extends ItemState {
  final String error;

  const ItemFailureState({required this.error});
}
