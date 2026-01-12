import 'package:flutter/material.dart';

class NeoCheckbox extends StatelessWidget {
  const NeoCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.child,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final shadowColor1 = isDarkMode ? const Color(0xFF1A1C19) : const Color(0xFFD1D3CB);
    final shadowColor2 = isDarkMode ? const Color(0xFF3A3E39) : Colors.white;

    final insetShadowColor1 = isDarkMode ? const Color(0xFF1A1C19) : const Color(0xFFD1D3CB);
    final insetShadowColor2 = isDarkMode ? const Color(0xFF3A3E39) : Colors.white;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: value
              ? [
                  BoxShadow(
                    color: insetShadowColor1,
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: insetShadowColor2,
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: -4,
                  ),
                ]
              : [
                  BoxShadow(
                    color: shadowColor1,
                    offset: const Offset(6, 6),
                    blurRadius: 12,
                  ),
                  BoxShadow(
                    color: shadowColor2,
                    offset: const Offset(-6, -6),
                    blurRadius: 12,
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: theme.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: value
                  ? Icon(
                      Icons.check,
                      size: 18,
                      color: theme.primaryColor,
                    )
                  : null,
            ),
            if (child != null) ...[
              const SizedBox(width: 16),
              Expanded(child: child!),
            ],
          ],
        ),
      ),
    );
  }
}
