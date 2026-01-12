import 'package:flutter/material.dart';

class NeoCard extends StatelessWidget {
  const NeoCard({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  final Widget? child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final shadowColor1 = isDarkMode ? const Color(0xFF1A1C19) : const Color(0xFFD1D3CB);
    final shadowColor2 = isDarkMode ? const Color(0xFF3A3E39) : Colors.white;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor1,
            offset: const Offset(8, 8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: shadowColor2,
            offset: const Offset(-8, -8),
            blurRadius: 16,
          ),
        ],
      ),
      child: child,
    );
  }
}
