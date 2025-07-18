import 'package:flutter/material.dart';

/// Semantic color palette for consistent theming throughout the app
class AppColors extends ThemeExtension<AppColors> {
  const AppColors._({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.error,
    required this.warning,
    required this.success,
    required this.info,
    required this.divider,
    required this.outline,
    required this.disabled,
    required this.overlay,
  });

  // Brand colors
  final Color primary;
  final Color secondary;

  // Background colors
  final Color background;
  final Color surface;

  // Text colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  // Semantic colors
  final Color error;
  final Color warning;
  final Color success;
  final Color info;

  // UI colors
  final Color divider;
  final Color outline;
  final Color disabled;
  final Color overlay;

  // Light theme colors
  static const AppColors light = AppColors._(
    // Brand
    primary: Color(0xFF2563EB),
    secondary: Color(0xFF7C3AED),
    
    // Background
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF8FAFC),
    
    // Text
    textPrimary: Color(0xFF1E293B),
    textSecondary: Color(0xFF64748B),
    textTertiary: Color(0xFF94A3B8),
    
    // Semantic
    error: Color(0xFFEF4444),
    warning: Color(0xFFF59E0B),
    success: Color(0xFF10B981),
    info: Color(0xFF3B82F6),
    
    // UI
    divider: Color(0xFFE2E8F0),
    outline: Color(0xFFCBD5E1),
    disabled: Color(0xFFCBD5E1),
    overlay: Color(0x80000000),
  );

  // Dark theme colors
  static const AppColors dark = AppColors._(
    // Brand
    primary: Color(0xFF3B82F6),
    secondary: Color(0xFF8B5CF6),
    
    // Background
    background: Color(0xFF0F172A),
    surface: Color(0xFF1E293B),
    
    // Text
    textPrimary: Color(0xFFF1F5F9),
    textSecondary: Color(0xFFCBD5E1),
    textTertiary: Color(0xFF64748B),
    
    // Semantic
    error: Color(0xFFF87171),
    warning: Color(0xFFFBBF24),
    success: Color(0xFF34D399),
    info: Color(0xFF60A5FA),
    
    // UI
    divider: Color(0xFF334155),
    outline: Color(0xFF475569),
    disabled: Color(0xFF475569),
    overlay: Color(0x80000000),
  );

  /// Creates a copy of this color palette with the given fields replaced
  AppColors copyWithColors({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? error,
    Color? warning,
    Color? success,
    Color? info,
    Color? divider,
    Color? outline,
    Color? disabled,
    Color? overlay,
  }) {
    return AppColors._(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
      divider: divider ?? this.divider,
      outline: outline ?? this.outline,
      disabled: disabled ?? this.disabled,
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
      background: Color.lerp(a.background, b.background, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      textPrimary: Color.lerp(a.textPrimary, b.textPrimary, t)!,
      textSecondary: Color.lerp(a.textSecondary, b.textSecondary, t)!,
      textTertiary: Color.lerp(a.textTertiary, b.textTertiary, t)!,
      error: Color.lerp(a.error, b.error, t)!,
      warning: Color.lerp(a.warning, b.warning, t)!,
      success: Color.lerp(a.success, b.success, t)!,
      info: Color.lerp(a.info, b.info, t)!,
      divider: Color.lerp(a.divider, b.divider, t)!,
      outline: Color.lerp(a.outline, b.outline, t)!,
      disabled: Color.lerp(a.disabled, b.disabled, t)!,
      overlay: Color.lerp(a.overlay, b.overlay, t)!,
    );
  }

  @override
  AppColors copyWith({ThemeData? theme}) {
    return this;
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors.lerpColors(this, other, t);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppColors &&
        other.primary == primary &&
        other.secondary == secondary &&
        other.background == background &&
        other.surface == surface &&
        other.textPrimary == textPrimary &&
        other.textSecondary == textSecondary &&
        other.textTertiary == textTertiary &&
        other.error == error &&
        other.warning == warning &&
        other.success == success &&
        other.info == info &&
        other.divider == divider &&
        other.outline == outline &&
        other.disabled == disabled &&
        other.overlay == overlay;
  }

  @override
  int get hashCode {
    return Object.hash(
      primary,
      secondary,
      background,
      surface,
      textPrimary,
      textSecondary,
      textTertiary,
      error,
      warning,
      success,
      info,
      divider,
      outline,
      disabled,
      overlay,
    );
  }

  @override
  String toString() {
    return 'AppColors(primary: $primary, secondary: $secondary, background: $background, surface: $surface, textPrimary: $textPrimary, textSecondary: $textSecondary, textTertiary: $textTertiary, error: $error, warning: $warning, success: $success, info: $info, divider: $divider, outline: $outline, disabled: $disabled, overlay: $overlay)';
  }
} 