import 'package:flutter/material.dart';

// Import theme classes
import '../app_spacing.dart';
import '../app_radius.dart';
import '../app_text_style.dart';
import '../app_colors.dart';

/// Centralized theme extensions registration
class AppThemeExtensions {
  const AppThemeExtensions._();

  /// Light theme extensions
  static List<ThemeExtension<dynamic>> get light => [
    const AppSpacing(),
    AppRadius.defaultRadius,
    AppTextStyle.withInter(),
    AppColors.light,
  ];

  /// Dark theme extensions
  static List<ThemeExtension<dynamic>> get dark => [
    const AppSpacing(),
    AppRadius.defaultRadius,
    AppTextStyle.withInter(),
    AppColors.dark,
  ];

  /// Get extensions based on brightness
  static List<ThemeExtension<dynamic>> getExtensions(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }

  /// Create ThemeData with all extensions
  static ThemeData createThemeData({
    required Brightness brightness,
    ThemeData? baseTheme,
  }) {
    final extensions = getExtensions(brightness);
    
    return (baseTheme ?? ThemeData(brightness: brightness)).copyWith(
      extensions: extensions,
    );
  }

  /// Create light theme
  static ThemeData get lightTheme => createThemeData(
    brightness: Brightness.light,
  );

  /// Create dark theme
  static ThemeData get darkTheme => createThemeData(
    brightness: Brightness.dark,
  );

  /// Create theme with custom base
  static ThemeData createCustomTheme({
    required Brightness brightness,
    required ThemeData baseTheme,
  }) {
    return createThemeData(
      brightness: brightness,
      baseTheme: baseTheme,
    );
  }

  /// Get current theme extensions from context
  static List<ThemeExtension<dynamic>> getCurrentExtensions(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return getExtensions(brightness);
  }

  /// Check if theme has all required extensions
  static bool hasAllExtensions(ThemeData theme) {
    final requiredExtensions = [
      AppSpacing,
      AppRadius,
      AppTextStyle,
      AppColors,
    ];

    for (final _ in requiredExtensions) {
      if (theme.extension<dynamic>() == null) {
        return false;
      }
    }
    return true;
  }

  /// Validate theme extensions
  static bool validateTheme(ThemeData theme) {
    return hasAllExtensions(theme);
  }
} 