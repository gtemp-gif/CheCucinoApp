import 'package:flutter/material.dart';

class NeoTextField extends StatelessWidget {
  const NeoTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final shadowColor1 = isDarkMode ? const Color(0xFF151714) : const Color(0xFFD1D3CB);
    final shadowColor2 = isDarkMode ? const Color(0xFF292D28) : Colors.white;

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: shadowColor1,
            offset: const Offset(5, 5),
            blurRadius: 10,
            spreadRadius: -5,
          ),
          BoxShadow(
            color: shadowColor2,
            offset: const Offset(-5, -5),
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
