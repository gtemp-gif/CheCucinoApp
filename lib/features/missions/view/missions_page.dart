import 'package:che_cucino/core/di/injector.dart';
import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:che_cucino/features/missions/bloc/missions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionsPage extends StatelessWidget {
  const MissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MissionsBloc>()..add(LoadMissions()),
      child: const MissionsView(),
    );
  }
}

class MissionsView extends StatelessWidget {
  const MissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.workspace_premium),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<MissionsBloc, MissionsState>(
        builder: (context, state) {
          if (state.status == MissionsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildInProgressSection(context, state),
              const SizedBox(height: 24),
              _buildNewMissionsSection(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Sustainable Goals',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Select your weekly missions to reduce waste and improve your kitchen habits.',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onBackground.withOpacity(0.6)),
        ),
      ],
    );
  }

  Widget _buildInProgressSection(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('In progress', style: theme.textTheme.headlineSmall),
            const Text('Ends in 2 days'),
          ],
        ),
        const SizedBox(height: 16),
        NeoCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                leading: Icon(Icons.eco, size: 40),
                title: Text('Veg Week'),
                subtitle: Text('Replace meat with legumes in 3 dinners.'),
              ),
              const SizedBox(height: 16),
              const LinearProgressIndicator(value: 2 / 3),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Progress'),
                  Text('2 / 3 meals'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNewMissionsSection(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New Missions', style: theme.textTheme.headlineSmall),
            const Text('Updated on Monday'),
          ],
        ),
        const SizedBox(height: 16),
        _buildMissionCard(
          context,
          icon: Icons.bakery_dining,
          title: 'Save the Bread',
          subtitle: 'Use stale bread in 2 creative recipes this week.',
          reward: 'Save ~€5',
        ),
        const SizedBox(height: 16),
        _buildMissionCard(
          context,
          icon: Icons.kitchen,
          title: 'Empty Fridge',
          subtitle: 'Cook a meal using only ingredients that are about to expire.',
          reward: 'Zero waste',
        ),
        const SizedBox(height: 16),
        _buildLockedMissionCard(context),
      ],
    );
  }

  Widget _buildMissionCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required String reward}) {
    return NeoCard(
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, size: 40),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reward),
              NeoButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8),
                    Text('Add'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLockedMissionCard(BuildContext context) {
    return NeoCard(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.calendar_month, size: 40),
                  title: Text('Pro Planner'),
                  subtitle: Text('Organize meals for the whole week in advance.'),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, size: 40, color: Colors.white),
                const SizedBox(height: 8),
                const Text('Unlock 10 more missions', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Switch to Gold'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
