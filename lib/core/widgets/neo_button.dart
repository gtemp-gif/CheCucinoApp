import 'package:flutter/material.dart';

class NeoButton extends StatefulWidget {
  const NeoButton({
    super.key,
    required this.child,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(9999)),
  });

  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  @override
  State<NeoButton> createState() => _NeoButtonState();
}

class _NeoButtonState extends State<NeoButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final shadowColor1 = isDarkMode ? const Color(0xFF1A1C19) : const Color(0xFFC6C8C0);
    final shadowColor2 = isDarkMode ? const Color(0xFF3A3E39) : Colors.white;

    final insetShadowColor1 = isDarkMode ? const Color(0xFF1A1C19) : const Color(0xFFC6C8C0);
    final insetShadowColor2 = isDarkMode ? const Color(0xFF3A3E39) : Colors.white;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: widget.borderRadius,
          boxShadow: _isPressed
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
                    offset: const Offset(5, 5),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: shadowColor2,
                    offset: const Offset(-5, -5),
                    blurRadius: 10,
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}
