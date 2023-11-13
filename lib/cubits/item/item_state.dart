part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemFetchSuccess extends ItemState {
  final List<StoreItem> items;

  const ItemFetchSuccess({required this.items});

  @override
  List<Object> get props => [items];

  ItemFetchSuccess copyWith({
    List<StoreItem>? items,
  }) {
    return ItemFetchSuccess(
      items: items ?? this.items,
    );
  }
}
