import 'package:flutter/material.dart';

/// Semantic radius scale for consistent border radius throughout the app
class AppRadius extends ThemeExtension<AppRadius> {
  const AppRadius._({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  // Base radius values
  static const double _xs = 4.0;
  static const double _sm = 8.0;
  static const double _md = 12.0;
  static const double _lg = 16.0;
  static const double _xl = 24.0;
  static const double _xxl = 32.0;

  // Semantic radius values
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  // Default instance
  static const AppRadius _default = AppRadius._(
    xs: _xs,
    sm: _sm,
    md: _md,
    lg: _lg,
    xl: _xl,
    xxl: _xxl,
  );

  /// Default radius instance
  static const AppRadius defaultRadius = _default;

  // BorderRadius instances
  BorderRadius get xsRadius => BorderRadius.circular(xs);
  BorderRadius get smRadius => BorderRadius.circular(sm);
  BorderRadius get mdRadius => BorderRadius.circular(md);
  BorderRadius get lgRadius => BorderRadius.circular(lg);
  BorderRadius get xlRadius => BorderRadius.circular(xl);
  BorderRadius get xxlRadius => BorderRadius.circular(xxl);

  // RoundedRectangleBorder instances
  RoundedRectangleBorder get xsShape => RoundedRectangleBorder(borderRadius: xsRadius);
  RoundedRectangleBorder get smShape => RoundedRectangleBorder(borderRadius: smRadius);
  RoundedRectangleBorder get mdShape => RoundedRectangleBorder(borderRadius: mdRadius);
  RoundedRectangleBorder get lgShape => RoundedRectangleBorder(borderRadius: lgRadius);
  RoundedRectangleBorder get xlShape => RoundedRectangleBorder(borderRadius: xlRadius);
  RoundedRectangleBorder get xxlShape => RoundedRectangleBorder(borderRadius: xxlRadius);

  /// Creates a copy of this radius with the given fields replaced
  AppRadius copyWithRadius({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return AppRadius._(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  /// Linearly interpolates between two radius values
  static AppRadius lerpRadius(AppRadius? a, AppRadius? b, double t) {
    if (a == null && b == null) return defaultRadius;
    if (a == null) return b!;
    if (b == null) return a;

    return AppRadius._(
      xs: _lerpDouble(a.xs, b.xs, t),
      sm: _lerpDouble(a.sm, b.sm, t),
      md: _lerpDouble(a.md, b.md, t),
      lg: _lerpDouble(a.lg, b.lg, t),
      xl: _lerpDouble(a.xl, b.xl, t),
      xxl: _lerpDouble(a.xxl, b.xxl, t),
    );
  }

  static double _lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return 0.0;
    if (a == null) return b!;
    if (b == null) return a;
    return a + (b - a) * t;
  }

  @override
  AppRadius copyWith({ThemeData? theme}) {
    return this;
  }

  @override
  AppRadius lerp(ThemeExtension<AppRadius>? other, double t) {
    if (other is! AppRadius) return this;
    return AppRadius.lerpRadius(this, other, t);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppRadius &&
        other.xs == xs &&
        other.sm == sm &&
        other.md == md &&
        other.lg == lg &&
        other.xl == xl &&
        other.xxl == xxl;
  }

  @override
  int get hashCode {
    return Object.hash(xs, sm, md, lg, xl, xxl);
  }

  @override
  String toString() {
    return 'AppRadius(xs: $xs, sm: $sm, md: $md, lg: $lg, xl: $xl, xxl: $xxl)';
  }
} 