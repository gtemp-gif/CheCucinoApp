import 'package:che_cucino/core/widgets/neo_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Skip'),
                ),
              ),
              const Spacer(),
              _buildContent(context),
              const Spacer(),
              _buildNavigation(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Neomorphic container colors
    final shadowColor1 = isDarkMode ? const Color(0xFF150B09) : const Color(0xFFDCDADA);
    final shadowColor2 = isDarkMode ? const Color(0xFF2F1B17) : Colors.white;

    return Column(
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: shadowColor1,
                offset: const Offset(8, 8),
                blurRadius: 20,
              ),
              BoxShadow(
                color: shadowColor2,
                offset: const Offset(-8, -8),
                blurRadius: 20,
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAUjHn2olhkSctM6EEepdsV8cQoGFBg7nAXqndkMjRNVsrKTecyDWqXsiLOxUWfGtCeASxA1jMEudub-ue3048co6oxU6wlF41Lcc19c_BwQHPXHYd2FzN2HUcOkNjENH8T8jjrxVceljgNvzqtGkFGghL-PD1th1AZvz3yN9FkYZzfPdyEBcV-hoJz9YzXK9PrSRfdjPB2iKaN_5dkADBfCdjB_3OSPrZLWLtQjF7Zh6XY61d0sZkCIV1KCFhfi2TWYM4t3QRBUw'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 48),
        Text(
          'Cook with what you have',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'CheCucino turns your ingredients, mood, and time into perfect recipes.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6)),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigation(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 0 ? theme.primaryColor : theme.disabledColor,
              ),
            );
          }),
        ),
        const SizedBox(height: 32),
import 'package:go_router/go_router.dart';
        NeoButton(
          onPressed: () => context.go('/login'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started',
                style: theme.textTheme.labelLarge?.copyWith(color: theme.primaryColor),
              ),
              Icon(Icons.arrow_forward_ios, color: theme.primaryColor, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(color: theme.textTheme.bodySmall?.color),
              children: [
                TextSpan(
                  text: 'Log in',
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
