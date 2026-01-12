part of 'shopping_list_bloc.dart';

enum ShoppingListStatus { initial, loading, success, failure }

class ShoppingListState extends Equatable {
  const ShoppingListState({
    this.status = ShoppingListStatus.initial,
    this.items = const [],
  });

  final ShoppingListStatus status;
  final List<ShoppingListItem> items;

  ShoppingListState copyWith({
    ShoppingListStatus? status,
    List<ShoppingListItem>? items,
  }) {
    return ShoppingListState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [status, items];
}

class ShoppingListItem extends Equatable {
  const ShoppingListItem({
    required this.id,
    required this.name,
    this.note,
    this.isUrgent = false,
    this.isChecked = false,
  });

  final String id;
  final String name;
  final String? note;
  final bool isUrgent;
  final bool isChecked;

  ShoppingListItem copyWith({
    String? id,
    String? name,
    String? note,
    bool? isUrgent,
    bool? isChecked,
  }) {
    return ShoppingListItem(
      id: id ?? this.id,
      name: name ?? this.name,
      note: note ?? this.note,
      isUrgent: isUrgent ?? this.isUrgent,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [id, name, note, isUrgent, isChecked];
}
