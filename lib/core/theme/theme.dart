import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static const Color primary = Color(0xFFEE4B2B);
  static const Color backgroundLight = Color(0xFFE9EBE2);
  static const Color backgroundDark = Color(0xFF1F221E);
  static const Color surfaceLight = Color(0xFFF2F1ED);
  static const Color surfaceDark = Color(0xFF2A2D29);
  static const Color accentTerracotta = Color(0xFFDCA794);
  static const Color textMain = Color(0xFF2C3E2D);
  static const Color textSecondary = Color(0xFF6B705C);

  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: accentTerracotta,
        background: backgroundLight,
        surface: surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: textMain,
        onSurface: textMain,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(_textTheme(Brightness.light)),
      useMaterial3: true,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primary,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: accentTerracotta,
        background: backgroundDark,
        surface: surfaceDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: Colors.white,
        onSurface: Colors.white,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme(_textTheme(Brightness.dark)),
      useMaterial3: true,
    );
  }

  static TextTheme _textTheme(Brightness brightness) {
    final onBackgroundColor = brightness == Brightness.light ? textMain : Colors.white;
    final onSurfaceColor = brightness == Brightness.light ? textMain : Colors.white;

    return TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: onBackgroundColor),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: onBackgroundColor),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: onBackgroundColor),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: onBackgroundColor),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: onSurfaceColor),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: onSurfaceColor),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: onSurfaceColor),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: onSurfaceColor),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: onSurfaceColor),
      bodyLarge: TextStyle(fontSize: 16, color: onSurfaceColor),
      bodyMedium: TextStyle(fontSize: 14, color: onSurfaceColor),
      bodySmall: TextStyle(fontSize: 12, color: textSecondary),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: onBackgroundColor),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: onBackgroundColor),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textSecondary),
    );
  }
}
