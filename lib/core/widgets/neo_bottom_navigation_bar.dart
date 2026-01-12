import 'package:flutter/material.dart';

class NeoBottomNavigationBar extends StatelessWidget {
  const NeoBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final shadowColor1 = isDarkMode ? const Color(0xFF1A1C19) : const Color(0xFFD1D3CB);
    final shadowColor2 = isDarkMode ? const Color(0xFF3A3E39) : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
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
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.unselectedWidgetColor,
      ),
    );
  }
}
