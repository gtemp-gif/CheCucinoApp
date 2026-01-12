import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRecipeImage(context),
            const SizedBox(height: 24),
            _buildRecipeTitle(context),
            const SizedBox(height: 16),
            _buildActionButtons(context),
            const SizedBox(height: 24),
            _buildIngredients(context),
            const SizedBox(height: 24),
            _buildInstructions(context),
          ],
        ),
      ),
      floatingActionButton: NeoButton(
        onPressed: () {},
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.play_circle),
            SizedBox(width: 8),
            Text('Start cooking'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildRecipeImage(BuildContext context) {
    return NeoCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Image.network(
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAH4PXBU7JgKQ7jI3LZlgFo4S5P1G1lILHSgVbfd-osJkE_IBmR5z0PKo1sqRLEN16gUpl8ZL1beyBTNqBvzv8yiShHOGlQbrWwY7t6gjOndd44lEHf-AhuC4TCig6wUq75IonXpCcuMUviPT_BrgYL7cMJJ4FuuQoP2Dj__TkN8_7sJila2NgEn4Y3v8LNJB-e24hPFJxdhmZjWPg_NlgzU8GJmQd10VolAEZaYb6VutPfagIujUxtdRv0aC5o3G7YZLOqceAvug',
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRecipeTitle(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spaghetti with Fresh Tomato',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: const [
            Chip(label: Text('15 min')),
            Chip(label: Text('450 kcal')),
            Chip(label: Text('Anti-waste')),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(context, icon: Icons.bookmark_add, label: 'Save recipe'),
        _buildActionButton(context, icon: Icons.star, label: 'Rate'),
        _buildActionButton(context, icon: Icons.swap_horiz, label: 'Replace ingredient'),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label}) {
    return NeoButton(
      child: Column(
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildIngredients(BuildContext context) {
    final theme = Theme.of(context);
    return NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ingredients', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          _buildIngredientItem(context, 'Spaghetti', '320g'),
          _buildIngredientItem(context, 'Cherry tomatoes', '500g'),
          _buildIngredientItem(context, 'Garlic', '1 clove'),
          _buildIngredientItem(context, 'Fresh basil', 'q.s.'),
          _buildIngredientItem(context, 'Olive oil', '2 tablespoons'),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(BuildContext context, String name, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(quantity, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildInstructions(BuildContext context) {
    final theme = Theme.of(context);
    return NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Instructions', style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),
          _buildInstructionStep(context, '1', 'Water preparation', 'Put a large pot of salted water to boil for the pasta.'),
          _buildInstructionStep(context, '2', 'The seasoning', 'Meanwhile, wash the tomatoes and cut them in half. In a large pan, sauté the garlic clove with the olive oil until golden brown.'),
          _buildInstructionStep(context, '3', 'Cooking and creaming', 'Drain the spaghetti al dente, keeping a ladleful of cooking water. Sauté them in a pan with the cherry tomatoes for 2 minutes, adding fresh basil at the end.'),
        ],
      ),
    );
  }

  Widget _buildInstructionStep(BuildContext context, String step, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            child: Text(step),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
