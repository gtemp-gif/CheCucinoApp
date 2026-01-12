import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(context),
          const SizedBox(height: 24),
          _buildStats(context),
          const SizedBox(height: 24),
          _buildTip(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          child: Icon(Icons.person, size: 60),
        ),
        const SizedBox(height: 16),
        Text(
          'Giulia Rossi',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Sustainable Chef • Level 12',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeoButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.history),
                  SizedBox(width: 8),
                  Text('History'),
                ],
              ),
            ),
            const SizedBox(width: 16),
            NeoButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 8),
                  Text('Share'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStats(BuildContext context) {
    return NeoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Statistics', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2,
            children: [
              _buildStatCard(context, '42', 'Meals Cooked'),
              _buildStatCard(context, '3.5kg', 'Waste Avoided'),
              _buildStatCard(context, '15', 'Favorite Recipes'),
              _buildStatCard(context, 'Creative', 'Common Mood'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String label) {
    return NeoCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildTip(BuildContext context) {
    return NeoCard(
      child: const Row(
        children: [
          Icon(Icons.tips_and_updates, color: Colors.orange),
          SizedBox(width: 16),
          Expanded(
            child: Text('Did you know? By cooking with ingredients you already have at home, you have saved around €24.00 this month. Great job!'),
          ),
        ],
      ),
    );
  }
}
