import 'package:flutter/material.dart';

/// Legacy color definitions for backward compatibility
/// These colors maintain the old naming convention for existing widgets
class LegacyColors {
  // Legacy background colors
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0F172A);
  
  // Legacy surface colors
  static const Color surfaceLight = Color(0xFFF1F4F8);
  static const Color surfaceDark = Color(0xFF1E293B);
  
  // Legacy text colors
  static const Color textPrimaryLight = Color(0xFF14181B);
  static const Color textPrimaryDark = Color(0xFFF1F5F9);
  
  static const Color textSecondaryLight = Color(0xFF57636C);
  static const Color textSecondaryDark = Color(0xFFCBD5E1);
  
  static const Color textTertiaryLight = Color(0xFF94A3B8);
  static const Color textTertiaryDark = Color(0xFF64748B);
  
  // Legacy UI colors
  static const Color dividerLight = Color(0xFFE2E8F0);
  static const Color dividerDark = Color(0xFF334155);
  
  static const Color overlayLight = Color(0x80000000);
  static const Color overlayDark = Color(0x80000000);

  /// Get legacy background color based on theme brightness
  static Color getBackgroundColor(Brightness brightness) {
    return brightness == Brightness.light ? backgroundLight : backgroundDark;
  }

  /// Get legacy surface color based on theme brightness
  static Color getSurfaceColor(Brightness brightness) {
    return brightness == Brightness.light ? surfaceLight : surfaceDark;
  }

  /// Get legacy primary text color based on theme brightness
  static Color getTextPrimaryColor(Brightness brightness) {
    return brightness == Brightness.light ? textPrimaryLight : textPrimaryDark;
  }

  /// Get legacy secondary text color based on theme brightness
  static Color getTextSecondaryColor(Brightness brightness) {
    return brightness == Brightness.light ? textSecondaryLight : textSecondaryDark;
  }

  /// Get legacy tertiary text color based on theme brightness
  static Color getTextTertiaryColor(Brightness brightness) {
    return brightness == Brightness.light ? textTertiaryLight : textTertiaryDark;
  }

  /// Get legacy divider color based on theme brightness
  static Color getDividerColor(Brightness brightness) {
    return brightness == Brightness.light ? dividerLight : dividerDark;
  }

  /// Get legacy overlay color based on theme brightness
  static Color getOverlayColor(Brightness brightness) {
    return brightness == Brightness.light ? overlayLight : overlayDark;
  }
} 