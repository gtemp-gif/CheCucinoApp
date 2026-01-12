import 'package:che_cucino/core/di/injector.dart';
import 'package:che_cucino/core/widgets/neo_checkbox.dart';
import 'package:che_cucino/features/shopping_list/bloc/shopping_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShoppingListBloc>()..add(LoadShoppingList()),
      child: const ShoppingListView(),
    );
  }
}

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ShoppingListBloc, ShoppingListState>(
        builder: (context, state) {
          if (state.status == ShoppingListStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = state.items;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildAddIngredientBar(context),
              const SizedBox(height: 24),
              _buildCategorySection(context, title: 'Vegetables and Fruit', items: items),
              const SizedBox(height: 24),
              _buildCategorySection(context, title: 'Dairy and Eggs', items: items),
              const SizedBox(height: 24),
              _buildCategorySection(context, title: 'Pantry', items: items),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAddIngredientBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Add ingredient...',
        prefixIcon: const Icon(Icons.add),
        suffixIcon: const Icon(Icons.mic),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, {required String title, required List<_ShoppingListItem> items}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: theme.textTheme.headlineSmall),
            Text('${items.length} items'),
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildShoppingListItem(context, item);
          },
        ),
      ],
    );
  }

  Widget _buildShoppingListItem(BuildContext context, ShoppingListItem item) {
    final theme = Theme.of(context);
    return NeoCheckbox(
      value: item.isChecked,
      onChanged: (value) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: TextStyle(
              decoration: item.isChecked ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          if (item.note != null) Text(item.note!),
          if (item.isUrgent)
            Text(
              'Missing for today\'s recipes',
              style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
