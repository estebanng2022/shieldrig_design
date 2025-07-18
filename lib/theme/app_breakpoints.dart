import 'package:flutter/material.dart';

/// Responsive breakpoints for consistent layout across different screen sizes
class AppBreakpoints {
  const AppBreakpoints._();

  // Breakpoint constants
  static const double mobile = 600.0;
  static const double tablet = 1024.0;
  static const double desktop = 1440.0;
  static const double wide = 1920.0;

  // Additional breakpoints for specific use cases
  static const double smallMobile = 320.0;
  static const double largeMobile = 480.0;
  static const double smallTablet = 768.0;
  static const double largeTablet = 1200.0;
  static const double smallDesktop = 1280.0;
  static const double largeDesktop = 1600.0;

  // Container max widths for different breakpoints
  static const double containerMobile = 100.0;
  static const double containerTablet = 80.0;
  static const double containerDesktop = 1200.0;
  static const double containerWide = 1400.0;

  // Grid columns for different breakpoints
  static const int gridColumnsMobile = 4;
  static const int gridColumnsTablet = 8;
  static const int gridColumnsDesktop = 12;
  static const int gridColumnsWide = 16;

  // Spacing multipliers for different breakpoints
  static const double spacingMultiplierMobile = 1.0;
  static const double spacingMultiplierTablet = 1.2;
  static const double spacingMultiplierDesktop = 1.5;
  static const double spacingMultiplierWide = 2.0;

  // Font size multipliers for different breakpoints
  static const double fontSizeMultiplierMobile = 1.0;
  static const double fontSizeMultiplierTablet = 1.1;
  static const double fontSizeMultiplierDesktop = 1.2;
  static const double fontSizeMultiplierWide = 1.3;

  // Helper methods for checking screen size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < tablet;
  }

  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tablet && width < desktop;
  }

  static bool isWide(BuildContext context) {
    return MediaQuery.of(context).size.width >= wide;
  }

  static bool isSmallMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < smallMobile;
  }

  static bool isLargeMobile(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= largeMobile && width < mobile;
  }

  static bool isSmallTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= smallTablet && width < tablet;
  }

  static bool isLargeTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= largeTablet && width < desktop;
  }

  // Get current breakpoint
  static Breakpoint getCurrentBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if (width < mobile) return Breakpoint.mobile;
    if (width < tablet) return Breakpoint.tablet;
    if (width < desktop) return Breakpoint.desktop;
    return Breakpoint.wide;
  }

  // Get container max width for current breakpoint
  static double getContainerMaxWidth(BuildContext context) {
    final breakpoint = getCurrentBreakpoint(context);
    
    switch (breakpoint) {
      case Breakpoint.mobile:
        return MediaQuery.of(context).size.width * (containerMobile / 100);
      case Breakpoint.tablet:
        return MediaQuery.of(context).size.width * (containerTablet / 100);
      case Breakpoint.desktop:
        return containerDesktop;
      case Breakpoint.wide:
        return containerWide;
    }
  }

  // Get grid columns for current breakpoint
  static int getGridColumns(BuildContext context) {
    final breakpoint = getCurrentBreakpoint(context);
    
    switch (breakpoint) {
      case Breakpoint.mobile:
        return gridColumnsMobile;
      case Breakpoint.tablet:
        return gridColumnsTablet;
      case Breakpoint.desktop:
        return gridColumnsDesktop;
      case Breakpoint.wide:
        return gridColumnsWide;
    }
  }

  // Get spacing multiplier for current breakpoint
  static double getSpacingMultiplier(BuildContext context) {
    final breakpoint = getCurrentBreakpoint(context);
    
    switch (breakpoint) {
      case Breakpoint.mobile:
        return spacingMultiplierMobile;
      case Breakpoint.tablet:
        return spacingMultiplierTablet;
      case Breakpoint.desktop:
        return spacingMultiplierDesktop;
      case Breakpoint.wide:
        return spacingMultiplierWide;
    }
  }

  // Get font size multiplier for current breakpoint
  static double getFontSizeMultiplier(BuildContext context) {
    final breakpoint = getCurrentBreakpoint(context);
    
    switch (breakpoint) {
      case Breakpoint.mobile:
        return fontSizeMultiplierMobile;
      case Breakpoint.tablet:
        return fontSizeMultiplierTablet;
      case Breakpoint.desktop:
        return fontSizeMultiplierDesktop;
      case Breakpoint.wide:
        return fontSizeMultiplierWide;
    }
  }

  // Responsive value helper
  static T responsive<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
    T? wide,
  }) {
    final breakpoint = getCurrentBreakpoint(context);
    
    switch (breakpoint) {
      case Breakpoint.mobile:
        return mobile;
      case Breakpoint.tablet:
        return tablet ?? mobile;
      case Breakpoint.desktop:
        return desktop ?? tablet ?? mobile;
      case Breakpoint.wide:
        return wide ?? desktop ?? tablet ?? mobile;
    }
  }

  // Screen orientation helpers
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Device pixel ratio helpers
  static bool isHighDensity(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio >= 2.0;
  }

  static bool isLowDensity(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio < 1.5;
  }
}

/// Enum for breakpoint types
enum Breakpoint {
  mobile,
  tablet,
  desktop,
  wide,
}

/// Extension for BuildContext to access breakpoints
extension BreakpointExtension on BuildContext {
  /// Check if current screen is mobile
  bool get isMobile => AppBreakpoints.isMobile(this);

  /// Check if current screen is tablet
  bool get isTablet => AppBreakpoints.isTablet(this);

  /// Check if current screen is desktop
  bool get isDesktop => AppBreakpoints.isDesktop(this);

  /// Check if current screen is wide
  bool get isWide => AppBreakpoints.isWide(this);

  /// Get current breakpoint
  Breakpoint get breakpoint => AppBreakpoints.getCurrentBreakpoint(this);

  /// Get container max width for current breakpoint
  double get containerMaxWidth => AppBreakpoints.getContainerMaxWidth(this);

  /// Get grid columns for current breakpoint
  int get gridColumns => AppBreakpoints.getGridColumns(this);

  /// Get spacing multiplier for current breakpoint
  double get spacingMultiplier => AppBreakpoints.getSpacingMultiplier(this);

  /// Get font size multiplier for current breakpoint
  double get fontSizeMultiplier => AppBreakpoints.getFontSizeMultiplier(this);

  /// Check if screen is in portrait orientation
  bool get isPortrait => AppBreakpoints.isPortrait(this);

  /// Check if screen is in landscape orientation
  bool get isLandscape => AppBreakpoints.isLandscape(this);

  /// Check if device has high pixel density
  bool get isHighDensity => AppBreakpoints.isHighDensity(this);

  /// Check if device has low pixel density
  bool get isLowDensity => AppBreakpoints.isLowDensity(this);
} 