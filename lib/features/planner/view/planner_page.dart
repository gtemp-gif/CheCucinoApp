import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class PlannerPage extends StatelessWidget {
  const PlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Plan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.workspace_premium),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildWeekSelector(context),
          const SizedBox(height: 24),
          _buildTodaySchedule(context),
        ],
      ),
    );
  }

  Widget _buildWeekSelector(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('This Week', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: const Text('October 2023'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildDayCard(context, 'MON', '16'),
              _buildDayCard(context, 'TUE', '17'),
              _buildDayCard(context, 'WED', '18', isSelected: true),
              _buildDayCard(context, 'THU', '19'),
              _buildDayCard(context, 'FRI', '20'),
              _buildDayCard(context, 'SAT', '21'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayCard(BuildContext context, String day, String date, {bool isSelected = false}) {
    final theme = Theme.of(context);
    return NeoCard(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day, style: TextStyle(color: isSelected ? theme.primaryColor : null)),
            const SizedBox(height: 4),
            Text(date, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isSelected ? theme.primaryColor : null)),
          ],
        ),
      ),
    );
  }

  Widget _buildTodaySchedule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today\'s program', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        _buildMealCard(context, time: '08:00', meal: 'Breakfast', title: 'Oatmeal and Red Fruits Porridge', icon: Icons.bakery_dining),
        _buildMealCard(context, time: '13:00', meal: 'Lunch', title: 'Quinoa and Avocado Bowl', icon: Icons.soup_kitchen, isCurrent: true),
        _buildMealCard(context, time: '16:30', meal: 'Snack', title: 'Apple and Almonds', icon: Icons.nutrition),
        _buildMealCard(context, time: '20:00', meal: 'Dinner', title: 'Baked Salmon with Asparagus', icon: Icons.dinner_dining),
      ],
    );
  }

  Widget _buildMealCard(BuildContext context, {required String time, required String meal, required String title, required IconData icon, bool isCurrent = false}) {
    final theme = Theme.of(context);
    return NeoCard(
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            Icon(icon),
          ],
        ),
        title: Text(meal, style: TextStyle(fontWeight: FontWeight.bold, color: isCurrent ? theme.primaryColor : null)),
        subtitle: Text(title),
        trailing: isCurrent ? ElevatedButton(onPressed: () {}, child: const Icon(Icons.play_arrow)) : const Icon(Icons.more_vert),
      ),
    );
  }
}
