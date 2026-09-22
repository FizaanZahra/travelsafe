import 'package:flutter/material.dart';

/// Centralized Design System Colors for Safety Application
class AppColors {
  // Main Backgrounds
  static const Color darkBackground = Color(0xFF0B0F19);
  static const Color cardBackground = Color(0xFF1E293B);
  static const Color surfaceHeader = Color(0xFF0F172A);

  // Safety Status Colors
  static const Color safeGreen = Colors.greenAccent;
  static const Color warningAmber = Colors.amberAccent;
  static const Color emergencyRed = Colors.redAccent;
  static const Color policeBlue = Colors.blueAccent;
  static const Color cyanGlow = Colors.cyanAccent;
  static const Color purpleAccent = Colors.purpleAccent;
  static const Color tealAccent = Colors.tealAccent;

  // Gradients
  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sosGradient = LinearGradient(
    colors: [Color(0xFFDC2626), Color(0xFF991B1B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient policeGradient = LinearGradient(
    colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient travelModeGradient = LinearGradient(
    colors: [Color(0xFF1E1B4B), Color(0xFF312E81)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
