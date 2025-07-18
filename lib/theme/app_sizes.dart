import 'package:flutter/material.dart';

/// Semantic size constants for consistent dimensions throughout the app
class AppSizes {
  /// Default constructor
  const AppSizes();

  // Icon sizes
  static const double iconSizeXs = 12.0;
  static const double iconSizeSm = 16.0;
  static const double iconSizeMd = 24.0;
  static const double iconSizeLg = 32.0;
  static const double iconSizeXl = 48.0;
  static const double iconSizeXxl = 64.0;

  // Button heights
  static const double buttonHeightXs = 28.0;
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightMd = 44.0;
  static const double buttonHeightLg = 52.0;
  static const double buttonHeightXl = 60.0;

  // Form field heights
  static const double formFieldHeightSm = 36.0;
  static const double formFieldHeightMd = 44.0;
  static const double formFieldHeightLg = 52.0;

  // Toolbar and navigation heights
  static const double toolbarHeight = 56.0;
  static const double appBarHeight = 64.0;
  static const double bottomNavHeight = 80.0;
  static const double fabSize = 56.0;
  static const double miniFabSize = 40.0;

  // Card and container sizes
  static const double cardRadius = 12.0;
  static const double cardElevation = 2.0;
  static const double containerMaxWidth = 1200.0;
  static const double containerMinWidth = 320.0;

  // Input and form sizes
  static const double inputBorderRadius = 8.0;
  static const double inputPadding = 12.0;
  static const double inputIconSize = 20.0;

  // Avatar sizes
  static const double avatarSizeXs = 24.0;
  static const double avatarSizeSm = 32.0;
  static const double avatarSizeMd = 40.0;
  static const double avatarSizeLg = 48.0;
  static const double avatarSizeXl = 64.0;
  static const double avatarSizeXxl = 96.0;

  // Badge sizes
  static const double badgeSizeSm = 16.0;
  static const double badgeSizeMd = 20.0;
  static const double badgeSizeLg = 24.0;

  // Progress and loading sizes
  static const double progressIndicatorSize = 24.0;
  static const double circularProgressSize = 32.0;
  static const double linearProgressHeight = 4.0;

  // Divider and border sizes
  static const double dividerHeight = 1.0;
  static const double borderWidth = 1.0;
  static const double borderWidthThick = 2.0;

  // Shadow and elevation sizes
  static const double shadowRadius = 4.0;
  static const double shadowOffset = 2.0;
  static const double elevationSm = 1.0;
  static const double elevationMd = 2.0;
  static const double elevationLg = 4.0;
  static const double elevationXl = 8.0;

  // Responsive breakpoints
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 1200.0;
  static const double desktopBreakpoint = 1440.0;

  // Alias para compatibilidad con widgets
  static const double md = iconSizeMd; // Si algún widget usa AppSizes.md
  static const double sm = iconSizeSm; // Si algún widget usa AppSizes.sm

  // Common size getters for easy access
  static Size get iconSizeSmSize => const Size(iconSizeSm, iconSizeSm);
  static Size get iconSizeMdSize => const Size(iconSizeMd, iconSizeMd);
  static Size get iconSizeLgSize => const Size(iconSizeLg, iconSizeLg);

  static Size get buttonSizeSm => Size.fromHeight(buttonHeightSm);
  static Size get buttonSizeMd => Size.fromHeight(buttonHeightMd);
  static Size get buttonSizeLg => Size.fromHeight(buttonHeightLg);

  static Size get formFieldSizeMd => Size.fromHeight(formFieldHeightMd);
  static Size get formFieldSizeLg => Size.fromHeight(formFieldHeightLg);

  static Size get avatarSizeMdSize => Size(avatarSizeMd, avatarSizeMd);
  static Size get avatarSizeLgSize => Size(avatarSizeLg, avatarSizeLg);
} 