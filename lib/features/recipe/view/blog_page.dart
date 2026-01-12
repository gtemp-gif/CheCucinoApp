import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News & Blog'),
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
          _buildCategoryFilters(context),
          const SizedBox(height: 24),
          _buildFeaturedArticle(context),
          const SizedBox(height: 24),
          _buildRecentArticles(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'News & Blog',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Discover tips, tricks and culinary news.',
          style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onBackground.withOpacity(0.6)),
        ),
      ],
    );
  }

  Widget _buildCategoryFilters(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryChip(context, 'All', isSelected: true),
          _buildCategoryChip(context, 'Sustainability'),
          _buildCategoryChip(context, 'Tips'),
          _buildCategoryChip(context, 'Seasonality'),
          _buildCategoryChip(context, 'Lifestyle'),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, {bool isSelected = false}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {},
        selectedColor: theme.primaryColor,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : theme.textTheme.bodyLarge?.color,
        ),
      ),
    );
  }

  Widget _buildFeaturedArticle(BuildContext context) {
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
              'https://lh3.googleusercontent.com/aida-public/AB6AXuAH4PXBU7JgKQ7jI3LZlgFo4S5P1G1lILHSgVbfd-osJkE_IBmR5z0PKo1sqRLEN16gUpl8ZL1beyBTNqBvzv8yiShHOGlQbrWwY7t6gjOndd44lEHf-AhuC4TCig6wUq75IonXpCcuMUviPT_BrgYL7cMJJ4FuuQoP2Dj__TkN8_7sJila2NgEn4Y3v8LNJB-e24hPFJxdhmZjWPg_NlgzU8GJmQd10VolAEZaYb6VutPfagIujUxtdRv0aC5o3G7YZLOqceAvug',
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
                  '5 creative methods to reduce food waste',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                const Text('Discover how to turn leftovers into gourmet dishes and save on your weekly shopping with these simple tricks.'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('12 May'),
                    const SizedBox(width: 16),
                    const Text('5 min read'),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward),
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

  Widget _buildRecentArticles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most recent',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        _buildArticleTile(
          context,
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDpK_6kgz4f2TTexx-qLFDEMJjAAMimROENwTWsAHYo1GKKI2wPhNwXT1eLSMhFOYsFjwXdS3Mhhh2BRCLg4Mp6nIe7pSgfq34742gKieP7VqGOxk2WHCqga29OnJYWz0nb9vWkT_jwR_2RSFVfsRbEzqOftHHYBjMpv4RptEBTZIkXVzkq5ErYwBwvgUhfcWqrjbQUAy6rh-MdfJzvnNH2_wBUIkHh0m1fWM8MYOA1ERhMcduav-o1KPEMWjynue15ow1Mi0vdHQ',
          category: 'Wellness',
          title: 'Spring Superfoods',
          subtitle: 'Why you should incorporate more quinoa and avocado into your diet.',
        ),
        const Divider(),
        _buildArticleTile(
          context,
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCq9RdalSc8IZ2j4QfVeDKlhBlLXaqqXLceaRiFYkEdZQvYlL_d5Qr5bc_dMOdzFBbMylUnjXYt4jfP0Atr4aYQnsx3At8BpEF-_vlLeIQy5p6YyA1y3eR2CXenmMXPCzFSLuVM4NCKtvEUIwjX7hoaXCqyzt47JyUnXi6yo1XpAL1nA_QfZVbMJ5bXWKfeJC3M7ck5GF1X5_WmsCfggatSgtjP42BNEIqTCkCWVsMmEZH4Dtu112yp25F-tYn9glpU60jff5pgzA',
          category: 'Lifestyle',
          title: 'Healthy comfort food?',
          subtitle: 'How to make your favorite dishes lighter without losing taste.',
        ),
      ],
    );
  }

  Widget _buildArticleTile(BuildContext context, {required String imageUrl, required String category, required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.toUpperCase(), style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
