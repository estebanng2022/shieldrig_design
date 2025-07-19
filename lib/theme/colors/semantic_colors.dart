import 'package:flutter/material.dart';

/// Semantic color definitions for consistent state representation
class SemanticColors {
  // Success states
  static const Color successLight = Color(0xFF249689);
  static const Color successDark = Color(0xFF34D399);
  static const Color successBackgroundLight = Color(0xFFF0FDF4);
  static const Color successBackgroundDark = Color(0xFF064E3B);
  static const Color successBorderLight = Color(0xFFBBF7D0);
  static const Color successBorderDark = Color(0xFF065F46);

  // Error states
  static const Color errorLight = Color(0xFFFF5963);
  static const Color errorDark = Color(0xFFFF6B81);
  static const Color errorBackgroundLight = Color(0xFFFEF2F2);
  static const Color errorBackgroundDark = Color(0xFF7F1D1D);
  static const Color errorBorderLight = Color(0xFFFECACA);
  static const Color errorBorderDark = Color(0xFF991B1B);

  // Warning states
  static const Color warningLight = Color(0xFFF9CF58);
  static const Color warningDark = Color(0xFFF9CF58);
  static const Color warningBackgroundLight = Color(0xFFFFFBEB);
  static const Color warningBackgroundDark = Color(0xFF78350F);
  static const Color warningBorderLight = Color(0xFFFED7AA);
  static const Color warningBorderDark = Color(0xFF92400E);

  // Info states
  static const Color infoLight = Color(0xFF3B82F6);
  static const Color infoDark = Color(0xFF60A5FA);
  static const Color infoBackgroundLight = Color(0xFFEFF6FF);
  static const Color infoBackgroundDark = Color(0xFF1E3A8A);
  static const Color infoBorderLight = Color(0xFFBFDBFE);
  static const Color infoBorderDark = Color(0xFF1E40AF);

  // Neutral states
  static const Color neutralLight = Color(0xFF6B7280);
  static const Color neutralDark = Color(0xFF9CA3AF);
  static const Color neutralBackgroundLight = Color(0xFFF9FAFB);
  static const Color neutralBackgroundDark = Color(0xFF374151);
  static const Color neutralBorderLight = Color(0xFFE5E7EB);
  static const Color neutralBorderDark = Color(0xFF4B5563);

  /// Get semantic color based on theme brightness
  static Color getSuccessColor(Brightness brightness) {
    return brightness == Brightness.light ? successLight : successDark;
  }

  /// Get semantic background color based on theme brightness
  static Color getSuccessBackgroundColor(Brightness brightness) {
    return brightness == Brightness.light ? successBackgroundLight : successBackgroundDark;
  }

  /// Get semantic border color based on theme brightness
  static Color getSuccessBorderColor(Brightness brightness) {
    return brightness == Brightness.light ? successBorderLight : successBorderDark;
  }

  /// Get error color based on theme brightness
  static Color getErrorColor(Brightness brightness) {
    return brightness == Brightness.light ? errorLight : errorDark;
  }

  /// Get error background color based on theme brightness
  static Color getErrorBackgroundColor(Brightness brightness) {
    return brightness == Brightness.light ? errorBackgroundLight : errorBackgroundDark;
  }

  /// Get error border color based on theme brightness
  static Color getErrorBorderColor(Brightness brightness) {
    return brightness == Brightness.light ? errorBorderLight : errorBorderDark;
  }

  /// Get warning color based on theme brightness
  static Color getWarningColor(Brightness brightness) {
    return brightness == Brightness.light ? warningLight : warningDark;
  }

  /// Get warning background color based on theme brightness
  static Color getWarningBackgroundColor(Brightness brightness) {
    return brightness == Brightness.light ? warningBackgroundLight : warningBackgroundDark;
  }

  /// Get warning border color based on theme brightness
  static Color getWarningBorderColor(Brightness brightness) {
    return brightness == Brightness.light ? warningBorderLight : warningBorderDark;
  }

  /// Get info color based on theme brightness
  static Color getInfoColor(Brightness brightness) {
    return brightness == Brightness.light ? infoLight : infoDark;
  }

  /// Get info background color based on theme brightness
  static Color getInfoBackgroundColor(Brightness brightness) {
    return brightness == Brightness.light ? infoBackgroundLight : infoBackgroundDark;
  }

  /// Get info border color based on theme brightness
  static Color getInfoBorderColor(Brightness brightness) {
    return brightness == Brightness.light ? infoBorderLight : infoBorderDark;
  }

  /// Get neutral color based on theme brightness
  static Color getNeutralColor(Brightness brightness) {
    return brightness == Brightness.light ? neutralLight : neutralDark;
  }

  /// Get neutral background color based on theme brightness
  static Color getNeutralBackgroundColor(Brightness brightness) {
    return brightness == Brightness.light ? neutralBackgroundLight : neutralBackgroundDark;
  }

  /// Get neutral border color based on theme brightness
  static Color getNeutralBorderColor(Brightness brightness) {
    return brightness == Brightness.light ? neutralBorderLight : neutralBorderDark;
  }
} 