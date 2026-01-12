import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:che_cucino/core/widgets/neo_card.dart';
import 'package:flutter/material.dart';

class SmartFridgePage extends StatelessWidget {
  const SmartFridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Fridge'),
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
          _buildSummary(context),
          const SizedBox(height: 24),
          _buildFridgeList(context),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NeoButton(
            onPressed: () {},
            child: const Icon(Icons.qr_code_scanner),
          ),
          const SizedBox(height: 16),
          NeoButton(
            onPressed: () {},
            child: const Icon(Icons.photo_camera),
          ),
          const SizedBox(height: 16),
          NeoButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search in the fridge...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total articles'),
            Text('24', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Icon(Icons.circle, color: Colors.red),
                Text('3 Urgent'),
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: [
                Icon(Icons.circle, color: Colors.yellow),
                Text('5 Expiring'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFridgeList(BuildContext context) {
    return Column(
      children: [
        _buildFridgeItem(context, icon: Icons.water_drop, name: 'Fresh milk', status: 'Today', color: Colors.red),
        _buildFridgeItem(context, icon: Icons.bakery_dining, name: 'Whole wheat bread', status: 'Expired', color: Colors.red),
        _buildFridgeItem(context, icon: Icons.egg, name: 'Organic eggs', status: '2 Days', color: Colors.yellow),
        _buildFridgeItem(context, icon: Icons.local_pizza, name: 'Mozzarella', status: '7 Days', color: Colors.green),
        _buildFridgeItem(context, icon: Icons.nutrition, name: 'Golden Apples', status: '10 Days', color: Colors.green),
      ],
    );
  }

  Widget _buildFridgeItem(BuildContext context, {required IconData icon, required String name, required String status, required Color color}) {
    return NeoCard(
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(name),
        subtitle: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(status),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }
}
