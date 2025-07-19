import 'package:flutter/material.dart';

/// Semantic color palette for consistent theming throughout the app
class AppColors extends ThemeExtension<AppColors> {
  const AppColors._({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.alternate,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.primaryText,
    required this.secondaryText,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.outline,
    required this.disabled,
    required this.transparent,
    required this.white,
    required this.black,
    required this.background,
    required this.surface,
    required this.overlay,
  });

  // Brand colors
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color alternate;

  // Background colors
  final Color primaryBackground;
  final Color secondaryBackground;

  // Text colors
  final Color primaryText;
  final Color secondaryText;

  // Semantic colors
  final Color success;
  final Color error;
  final Color warning;
  final Color info;

  // UI colors
  final Color outline;
  final Color disabled;
  
  // Additional colors for common use cases
  final Color transparent;
  final Color white;
  final Color black;

  // Legacy properties for backward compatibility
  final Color background;
  final Color surface;
  final Color overlay;

  // Light theme colors
  static const AppColors light = AppColors._(
    primary: Color(0xFF3A2BC7),
    secondary: Color(0xFF39D2C0),
    tertiary: Color(0xFFEE8B60),
    alternate: Color(0xFFE0E3E7),
    primaryBackground: Color(0xFFF1F4F8),
    secondaryBackground: Color(0xFFFFFFFF),
    primaryText: Color(0xFF14181B),
    secondaryText: Color(0xFF57636C),
    success: Color(0xFF249689),
    error: Color(0xFFFF5963),
    warning: Color(0xFFF9CF58),
    info: Color(0xFFFFFFFF),
    outline: Color(0xFF57636C),
    disabled: Color(0xFF57636C),
    transparent: Colors.transparent,
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF1F4F8),
    overlay: Color(0x80000000),
  );

  // Dark theme colors
  static const AppColors dark = AppColors._(
    primary: Color(0xFFB2A4FF),
    secondary: Color(0xFF39D2C0),
    tertiary: Color(0xFFFFB385),
    alternate: Color(0xFF262D34),
    primaryBackground: Color(0xFF181A20),
    secondaryBackground: Color(0xFF23262B),
    primaryText: Color(0xFFFFFFFF),
    secondaryText: Color(0xFFB0B8C1),
    success: Color(0xFF34D399),
    error: Color(0xFFFF6B81),
    warning: Color(0xFFF9CF58),
    info: Color(0xFF23262B),
    outline: Color(0xFFB0B8C1),
    disabled: Color(0xFFB0B8C1),
    transparent: Colors.transparent,
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    background: Color(0xFF0F172A),
    surface: Color(0xFF1E293B),
    overlay: Color(0x80000000),
  );

  @override
  AppColors copyWith({ThemeData? theme}) {
    return this;
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors.lerpColors(this, other, t);
  }

  /// Creates a copy of this color palette with the given fields replaced
  AppColors copyWithColors({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? alternate,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? primaryText,
    Color? secondaryText,
    Color? success,
    Color? error,
    Color? warning,
    Color? info,
    Color? outline,
    Color? disabled,
    Color? transparent,
    Color? white,
    Color? black,
    Color? background,
    Color? surface,
    Color? overlay,
  }) {
    return AppColors._(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      alternate: alternate ?? this.alternate,
      primaryBackground: primaryBackground ?? this.primaryBackground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      outline: outline ?? this.outline,
      disabled: disabled ?? this.disabled,
      transparent: transparent ?? this.transparent,
      white: white ?? this.white,
      black: black ?? this.black,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      overlay: overlay ?? this.overlay,
    );
  }

  /// Linearly interpolates between two color palettes
  static AppColors lerpColors(AppColors? a, AppColors? b, double t) {
    if (a == null && b == null) return light;
    if (a == null) return b!;
    if (b == null) return a;

    return AppColors._(
      primary: Color.lerp(a.primary, b.primary, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      tertiary: Color.lerp(a.tertiary, b.tertiary, t)!,
      alternate: Color.lerp(a.alternate, b.alternate, t)!,
      primaryBackground: Color.lerp(a.primaryBackground, b.primaryBackground, t)!,
      secondaryBackground: Color.lerp(a.secondaryBackground, b.secondaryBackground, t)!,
      primaryText: Color.lerp(a.primaryText, b.primaryText, t)!,
      secondaryText: Color.lerp(a.secondaryText, b.secondaryText, t)!,
      success: Color.lerp(a.success, b.success, t)!,
      error: Color.lerp(a.error, b.error, t)!,
      warning: Color.lerp(a.warning, b.warning, t)!,
      info: Color.lerp(a.info, b.info, t)!,
      outline: Color.lerp(a.outline, b.outline, t)!,
      disabled: Color.lerp(a.disabled, b.disabled, t)!,
      transparent: Color.lerp(a.transparent, b.transparent, t)!,
      white: Color.lerp(a.white, b.white, t)!,
      black: Color.lerp(a.black, b.black, t)!,
      background: Color.lerp(a.background, b.background, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      overlay: Color.lerp(a.overlay, b.overlay, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppColors &&
        other.primary == primary &&
        other.secondary == secondary &&
        other.tertiary == tertiary &&
        other.alternate == alternate &&
        other.primaryBackground == primaryBackground &&
        other.secondaryBackground == secondaryBackground &&
        other.primaryText == primaryText &&
        other.secondaryText == secondaryText &&
        other.success == success &&
        other.error == error &&
        other.warning == warning &&
        other.info == info &&
        other.outline == outline &&
        other.disabled == disabled &&
        other.transparent == transparent &&
        other.white == white &&
        other.black == black &&
        other.background == background &&
        other.surface == surface &&
        other.overlay == overlay;
  }

  @override
  int get hashCode {
    return Object.hash(
      primary,
      secondary,
      tertiary,
      alternate,
      primaryBackground,
      secondaryBackground,
      primaryText,
      secondaryText,
      success,
      error,
      warning,
      info,
      outline,
      disabled,
      transparent,
      white,
      black,
      background,
      surface,
      overlay,
    );
  }
} 