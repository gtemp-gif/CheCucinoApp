import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';

class ShellPage extends StatelessWidget {
  const ShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                context.read<NavigationBloc>().add(GoHome());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profilo'),
              onTap: () {
                context.read<NavigationBloc>().add(GoProfile());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Impostazioni'),
              onTap: () {
                context.read<NavigationBloc>().add(GoSettings());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<NavigationBloc, NavigationPage>(
        builder: (context, page) {
          return switch (page) {
            NavigationPage.home => const Center(child: Text('Home')),
            NavigationPage.profile => const Center(child: Text('Profile')),
            NavigationPage.settings => const Center(child: Text('Settings')),
          };
        },
      ),
    );
  }
}
