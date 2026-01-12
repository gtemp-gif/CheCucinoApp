part of 'shopping_list_bloc.dart';

abstract class ShoppingListEvent extends Equatable {
  const ShoppingListEvent();

  @override
  List<Object> get props => [];
}

class LoadShoppingList extends ShoppingListEvent {}

class AddShoppingItem extends ShoppingListEvent {
  const AddShoppingItem(this.item);

  final ShoppingListItem item;

  @override
  List<Object> get props => [item];
}

class UpdateShoppingItem extends ShoppingListEvent {
  const UpdateShoppingItem(this.item);

  final ShoppingListItem item;

  @override
  List<Object> get props => [item];
}

class RemoveShoppingItem extends ShoppingListEvent {
  const RemoveShoppingItem(this.item);

  final ShoppingListItem item;

  @override
  List<Object> get props => [item];
}
