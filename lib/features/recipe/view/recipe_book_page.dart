import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class RecipeBookPage extends StatelessWidget {
  const RecipeBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Recipe Book'),
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
          _buildSearchBar(context),
          const SizedBox(height: 24),
          _buildCollections(context),
          const SizedBox(height: 24),
          _buildSavedRecipes(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search your recipes...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
    );
  }

  Widget _buildCollections(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Your collections', style: Theme.of(context).textTheme.headlineSmall),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('New'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCollectionCard(
                context,
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAH4PXBU7JgKQ7jI3LZlgFo4S5P1G1lILHSgVbfd-osJkE_IBmR5z0PKo1sqRLEN16gUpl8ZL1beyBTNqBvzv8yiShHOGlQbrWwY7t6gjOndd44lEHf-AhuC4TCig6wUq75IonXpCcuMUviPT_BrgYL7cMJJ4FuuQoP2Dj__TkN8_7sJila2NgEn4Y3v8LNJB-e24hPFJxdhmZjWPg_NlgzU8GJmQd10VolAEZaYb6VutPfagIujUxtdRv0aC5o3G7YZLOqceAvug',
                title: 'First dishes',
                recipeCount: 12,
              ),
              _buildCollectionCard(
                context,
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDpK_6kgz4f2TTexx-qLFDEMJjAAMimROENwTWsAHYo1GKKI2wPhNwXT1eLSMhFOYsFjwXdS3Mhhh2BRCLg4Mp6nIe7pSgfq34742gKieP7VqGOxk2WHCqga29OnJYWz0nb9vWkT_jwR_2RSFVfsRbEzqOftHHYBjMpv4RptEBTZIkXVzkq5ErYwBwvgUhfcWqrjbQUAy6rh-MdfJzvnNH2_wBUIkHh0m1fWM8MYOA1ERhMcduav-o1KPEMWjynue15ow1Mi0vdHQ',
                title: 'Healthy & Fit',
                recipeCount: 8,
              ),
              _buildCollectionCard(
                context,
                icon: Icons.cake,
                title: 'Quick desserts',
                recipeCount: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCollectionCard(BuildContext context, {String? imageUrl, IconData? icon, required String title, required int recipeCount}) {
    return SizedBox(
      width: 150,
      child: NeoCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              )
            else
              SizedBox(
                height: 100,
                width: 150,
                child: Icon(icon, size: 50),
              ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('$recipeCount recipes', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedRecipes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Saved Recipes', style: Theme.of(context).textTheme.headlineSmall),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.view_list)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            if (index == 3) {
              return _buildAddRecipeCard(context);
            }
            return _buildRecipeCard(
              context,
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCq9RdalSc8IZ2j4QfVeDKlhBlLXaqqXLceaRiFYkEdZQvYlL_d5Qr5bc_dMOdzFBbMylUnjXYt4jfP0Atr4aYQnsx3At8BpEF-_vlLeIQy5p6YyA1y3eR2CXenmMXPCzFSLuVM4NCKtvEUIwjX7hoaXCqyzt47JyUnXi6yo1XpAL1nA_QfZVbMJ5bXWKfeJC3M7ck5GF1X5_WmsCfggatSgtjP42BNEIqTCkCWVsMmEZH4Dtu112yp25F-tYn9glpU60jff5pgzA',
              title: 'Chicken Curry',
              tags: ['30 min', 'Spicy'],
            );
          },
        ),
      ],
    );
  }

  Widget _buildRecipeCard(BuildContext context, {required String imageUrl, required String title, required List<String> tags}) {
    return NeoCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  children: tags.map((tag) => Text(tag, style: Theme.of(context).textTheme.bodySmall)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddRecipeCard(BuildContext context) {
    return NeoCard(
      child: InkWell(
        onTap: () {},
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 40),
              SizedBox(height: 8),
              Text('Add your recipe'),
            ],
          ),
        ),
      ),
    );
  }
}
