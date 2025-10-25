import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF26A69A);
  static const Color primaryVariant = Color(0xFF00695C);
  static const Color secondary = Color(0xFF4DB6AC);
  static const Color secondaryVariant = Color(0xFF26A69A);
  
  static const Color accent = Color(0xFF80CBC4);
  static const Color accentLight = Color(0xFFB2DFDB);
  
  static const Color background = Color(0xFFF0F8F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFE57373);
  
  static const Color darkBackground = Color(0xFF0D1B1A);
  static const Color darkSurface = Color(0xFF1A2F2E);
  static const Color darkPrimary = Color(0xFF4DB6AC);
  
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);
  static const Color darkTextHint = Color(0xFF666666);

  static const Color success = Color(0xFF66BB6A);
  static const Color warning = Color(0xFFFFB74D);
  static const Color info = Color(0xFF26A69A);
  
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE0F2F1);
  static const Color shadow = Color(0x1A26A69A);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryVariant],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient headerGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [accentLight, surface],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}