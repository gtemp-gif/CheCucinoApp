import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSubscriptionSection(context),
          const SizedBox(height: 24),
          _buildPreferencesSection(context),
          const SizedBox(height: 24),
          _buildApplicationSection(context),
        ],
      ),
    );
  }

  Widget _buildSubscriptionSection(BuildContext context) {
    final theme = Theme.of(context);
    return NeoCard(
      child: ListTile(
        leading: const Icon(Icons.workspace_premium, size: 40),
        title: const Text('Subscription status'),
        subtitle: Text('CheCucino Plus', style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Preferences', style: Theme.of(context).textTheme.titleSmall),
        NeoCard(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.restaurant),
                title: const Text('Dietary preferences'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              SwitchListTile(
                secondary: const Icon(Icons.local_fire_department),
                title: const Text('Calorie visibility'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                secondary: const Icon(Icons.water_drop),
                title: const Text('Water reminder'),
                value: false,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Application', style: Theme.of(context).textTheme.titleSmall),
        NeoCard(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.mood),
                title: const Text('Mood and reminders'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.tune),
                title: const Text('General'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Privacy and security'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
