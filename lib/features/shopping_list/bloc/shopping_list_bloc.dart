import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shopping_list_event.dart';
part 'shopping_list_state.dart';

class ShoppingListBloc extends Bloc<ShoppingListEvent, ShoppingListState> {
  ShoppingListBloc() : super(const ShoppingListState()) {
    on<LoadShoppingList>(_onLoadShoppingList);
    on<AddShoppingItem>(_onAddShoppingItem);
    on<UpdateShoppingItem>(_onUpdateShoppingItem);
    on<RemoveShoppingItem>(_onRemoveShoppingItem);
  }

  void _onLoadShoppingList(
    LoadShoppingList event,
    Emitter<ShoppingListState> emit,
  ) {
    // Replace with actual data loading
    const items = [
      ShoppingListItem(id: '1', name: 'Ramati Tomatoes', isUrgent: true),
      ShoppingListItem(id: '2', name: 'Zucchini', note: '~ 500g'),
      ShoppingListItem(id: '3', name: 'Fresh Basil', isChecked: true),
      ShoppingListItem(id: '4', name: 'Mozzarella', isUrgent: true),
      ShoppingListItem(id: '5', name: 'Parmigiano Reggiano', isChecked: true),
      ShoppingListItem(id: '6', name: 'Semolina pasta', note: 'Spaghetti n.5'),
      ShoppingListItem(id: '7', name: 'Olive oil', isChecked: true),
    ];
    emit(state.copyWith(status: ShoppingListStatus.success, items: items));
  }

  void _onAddShoppingItem(
    AddShoppingItem event,
    Emitter<ShoppingListState> emit,
  ) {
    final items = List<ShoppingListItem>.from(state.items)..add(event.item);
    emit(state.copyWith(items: items));
  }

  void _onUpdateShoppingItem(
    UpdateShoppingItem event,
    Emitter<ShoppingListState> emit,
  ) {
    final items = state.items.map((item) {
      return item.id == event.item.id ? event.item : item;
    }).toList();
    emit(state.copyWith(items: items));
  }

  void _onRemoveShoppingItem(
    RemoveShoppingItem event,
    Emitter<ShoppingListState> emit,
  ) {
    final items = state.items.where((item) => item.id != event.item.id).toList();
    emit(state.copyWith(items: items));
  }
}
