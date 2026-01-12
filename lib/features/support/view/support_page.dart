import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(context),
          const SizedBox(height: 24),
          _buildRequestTypeSection(context),
          const SizedBox(height: 24),
          _buildMessageSection(context),
          const SizedBox(height: 24),
          NeoButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.send),
                SizedBox(width: 8),
                Text('Send Report'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Do you need help with CheCucino? Send us a message and we will get back to you as soon as possible.',
      textAlign: TextAlign.center,
      style: theme.textTheme.titleMedium,
    );
  }

  Widget _buildRequestTypeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Request type', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        RadioListTile(
          title: const Text('Technical problem'),
          value: 1,
          groupValue: 1,
          onChanged: (value) {},
        ),
        RadioListTile(
          title: const Text('Suggestion'),
          value: 2,
          groupValue: 1,
          onChanged: (value) {},
        ),
        RadioListTile(
          title: const Text('General question'),
          value: 3,
          groupValue: 1,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildMessageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('How can we help you?', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        const TextField(
          maxLines: 6,
          decoration: InputDecoration(
            hintText: 'Describe your problem or suggestion here...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.attach_file),
          label: const Text('Attach file'),
        ),
      ],
    );
  }
}
