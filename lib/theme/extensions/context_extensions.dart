import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_spacing.dart';
import '../app_radius.dart';
import '../app_text_style.dart';
import '../app_opacities.dart';
import '../app_sizes.dart';
import '../app_icons.dart';

/// Extension methods for accessing theme components from BuildContext
extension ThemeExtensions on BuildContext {
  /// Get colors from theme
  AppColors get colors {
    return AppColors.light; // Default to light theme for now
  }

  /// Get spacing from theme
  AppSpacing get spacing {
    return AppSpacing();
  }

  /// Get radius from theme
  AppRadius get radius {
    return AppRadius.defaultRadius;
  }

  /// Get text styles from theme
  AppTextStyle get textStyle {
    return AppTextStyle.withInter();
  }

  /// Get opacities from theme
  AppOpacities get opacities {
    return AppOpacities();
  }

  /// Get sizes from theme
  AppSizes get sizes {
    return AppSizes();
  }

  /// Get icons from theme
  AppIcons get icons {
    return AppIcons();
  }

  /// Convenience getter for theme brightness
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Convenience getter for theme brightness
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// Convenience getter for responsive breakpoints
  bool get isMobile => MediaQuery.of(this).size.width < 600;

  /// Convenience getter for responsive breakpoints
  bool get isTablet => MediaQuery.of(this).size.width >= 600 && MediaQuery.of(this).size.width < 1200;

  /// Convenience getter for responsive breakpoints
  bool get isDesktop => MediaQuery.of(this).size.width >= 1200;

  /// Convenience getter for screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Convenience getter for screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Convenience getter for screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Convenience getter for safe area padding
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  /// Convenience getter for view padding
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// Convenience getter for view insets
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
} 