import 'package:flutter/material.dart';
import 'app_spacing.dart';
import 'app_radius.dart';
import 'app_text_style.dart';
import 'app_colors.dart';

/// Central theme class for the ShieldRig Design System
class AppTheme {
  const AppTheme._();

  /// Get the current theme from context
  static AppTheme of(BuildContext context) {
    return const AppTheme._();
  }

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      extensions: [
        AppSpacing(),
        AppRadius.defaultRadius,
        AppTextStyle.withInter(),
        AppColors.light,
      ],
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      extensions: [
        AppSpacing(),
        AppRadius.defaultRadius,
        AppTextStyle.withInter(),
        AppColors.dark,
      ],
    );
  }

  /// Get theme data from context
  static ThemeData themeOf(BuildContext context) {
    return Theme.of(context);
  }

  /// Check if current theme is dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Check if current theme is light mode
  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  /// Get colors from current theme
  static AppColors colorsOf(BuildContext context) {
    return AppColors.light;
  }

  /// Get spacing from current theme
  static AppSpacing spacingOf(BuildContext context) {
    return AppSpacing();
  }

  /// Get radius from current theme
  static AppRadius radiusOf(BuildContext context) {
    return AppRadius.defaultRadius;
  }

  /// Get text styles from current theme
  static AppTextStyle textStyleOf(BuildContext context) {
    return AppTextStyle.withInter();
  }
} 