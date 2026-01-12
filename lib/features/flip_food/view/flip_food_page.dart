import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class FlipFoodPage extends StatelessWidget {
  const FlipFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlipFood'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildSearch(context),
          const SizedBox(height: 24),
          _buildSuggestions(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Smart replacements',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Are you missing an ingredient? Find the perfect alternative without compromising the flavor of your dish.',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onBackground.withOpacity(0.6)),
        ),
      ],
    );
  }

  Widget _buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'e.g. Milk, Eggs, Flour...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
    );
  }

  Widget _buildSuggestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Suggested alternatives', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        _buildSuggestionCard(
          context,
          title: 'Olive oil',
          subtitle: 'Ideal for savory cooking',
          description: 'Use olive oil in the proportion of 80% compared to butter (e.g. 80g of oil for 100g of butter). Perfect for sautéing or roasting.',
          tag: 'Excellent alternative',
          tagColor: Colors.green,
        ),
        _buildSuggestionCard(
          context,
          title: 'Greek Yogurt',
          subtitle: 'For baked goods',
          description: 'Replace in a 1:1 ratio to reduce fat. Keeps desserts moist and fluffy, adding a light acidic note.',
          tag: 'Good option',
          tagColor: Colors.yellow,
        ),
        _buildSuggestionCard(
          context,
          title: 'Avocado puree',
          subtitle: 'Vegan & Healthy',
          description: 'Rich in healthy fats. Great for cookies and chocolate brownies where the green color is masked.',
          tag: 'Creative',
          tagColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildSuggestionCard(BuildContext context, {required String title, required String subtitle, required String description, required String tag, required Color tagColor}) {
    return NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: Chip(
              label: Text(tag),
              backgroundColor: tagColor.withOpacity(0.2),
            ),
          ),
          const SizedBox(height: 8),
          Text(description),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
            label: const Text('Nutritional details'),
          ),
        ],
      ),
    );
  }
}
