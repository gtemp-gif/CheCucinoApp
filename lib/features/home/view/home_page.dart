import 'package:che_cucino/core/di/injector.dart';
import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:che_cucino/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(LoadHomeEvent()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheCucino'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMoodSelector(context),
          const SizedBox(height: 24),
          _buildShuffleButton(context),
          const SizedBox(height: 24),
          _buildRecipeFeed(context),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Text('CheCucino'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.smart_toy),
            title: const Text('Smart Fridge'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Shopping List'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMoodSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How are you feeling today?',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildMoodIcon(context, Icons.sentiment_dissatisfied),
              _buildMoodIcon(context, Icons.sentiment_neutral),
              _buildMoodIcon(context, Icons.sentiment_satisfied, isSelected: true),
              _buildMoodIcon(context, Icons.local_fire_department),
              _buildMoodIcon(context, Icons.bedtime),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMoodIcon(BuildContext context, IconData icon, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: NeoButton(
        child: Icon(
          icon,
          size: 30,
          color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }

  Widget _buildShuffleButton(BuildContext context) {
    return Center(
      child: NeoButton(
        onPressed: () {},
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shuffle),
            SizedBox(width: 8),
            Text('Reload ideas'),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeFeed(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'What I cook today',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See all'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == HomeStatus.success) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.recipes.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final recipe = state.recipes[index];
                  return _buildRecipeCard(
                    context,
                    imageUrl: recipe.imageUrl,
                    title: recipe.title,
                    tags: recipe.tags,
                  );
                },
              );
            } else {
              return const Center(child: Text('Failed to load recipes.'));
            }
          },
        ),
      ],
    );
  }

import 'package:go_router/go_router.dart';
  Widget _buildRecipeCard(BuildContext context, {required String imageUrl, required String title, required List<String> tags}) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.go('/recipe-details'),
      child: NeoCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: tags.map((tag) => Chip(label: Text(tag))).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: NeoButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.skillet),
                            SizedBox(width: 8),
                            Text('Cook this'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    NeoButton(
                      onPressed: () {},
                      child: const Icon(Icons.bookmark_border),
                    ),
                    const SizedBox(width: 8),
                    NeoButton(
                      onPressed: () {},
                      child: const Icon(Icons.swap_horiz),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
