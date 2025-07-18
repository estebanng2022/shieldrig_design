import 'package:flutter/material.dart';

/// Semantic spacing scale for consistent padding and gaps throughout the app
class AppSpacing extends ThemeExtension<AppSpacing> {
  /// Default constructor
  const AppSpacing();

  // Base spacing values
  static const double _xs = 4.0;
  static const double _sm = 8.0;
  static const double _md = 16.0;
  static const double _lg = 24.0;
  static const double _xl = 32.0;
  static const double _xxl = 48.0;

  // Semantic getters
  static const double xs = _xs;
  static const double sm = _sm;
  static const double md = _md;
  static const double lg = _lg;
  static const double xl = _xl;
  static const double xxl = _xxl;

  // Common spacing combinations
  static const EdgeInsets xsPadding = EdgeInsets.all(xs);
  static const EdgeInsets smPadding = EdgeInsets.all(sm);
  static const EdgeInsets mdPadding = EdgeInsets.all(md);
  static const EdgeInsets lgPadding = EdgeInsets.all(lg);
  static const EdgeInsets xlPadding = EdgeInsets.all(xl);
  static const EdgeInsets xxlPadding = EdgeInsets.all(xxl);

  // Horizontal spacing
  static const EdgeInsets xsHorizontal = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets smHorizontal = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets mdHorizontal = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets lgHorizontal = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets xlHorizontal = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets xxlHorizontal = EdgeInsets.symmetric(horizontal: xxl);

  // Vertical spacing
  static const EdgeInsets xsVertical = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets smVertical = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets mdVertical = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets lgVertical = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets xlVertical = EdgeInsets.symmetric(vertical: xl);
  static const EdgeInsets xxlVertical = EdgeInsets.symmetric(vertical: xxl);

  // Gap widgets
  static const SizedBox xsGap = SizedBox(height: xs, width: xs);
  static const SizedBox smGap = SizedBox(height: sm, width: sm);
  static const SizedBox mdGap = SizedBox(height: md, width: md);
  static const SizedBox lgGap = SizedBox(height: lg, width: lg);
  static const SizedBox xlGap = SizedBox(height: xl, width: xl);
  static const SizedBox xxlGap = SizedBox(height: xxl, width: xxl);

  // Horizontal gaps
  static const SizedBox xsHorizontalGap = SizedBox(width: xs);
  static const SizedBox smHorizontalGap = SizedBox(width: sm);
  static const SizedBox mdHorizontalGap = SizedBox(width: md);
  static const SizedBox lgHorizontalGap = SizedBox(width: lg);
  static const SizedBox xlHorizontalGap = SizedBox(width: xl);
  static const SizedBox xxlHorizontalGap = SizedBox(width: xxl);

  // Vertical gaps
  static const SizedBox xsVerticalGap = SizedBox(height: xs);
  static const SizedBox smVerticalGap = SizedBox(height: sm);
  static const SizedBox mdVerticalGap = SizedBox(height: md);
  static const SizedBox lgVerticalGap = SizedBox(height: lg);
  static const SizedBox xlVerticalGap = SizedBox(height: xl);
  static const SizedBox xxlVerticalGap = SizedBox(height: xxl);

  @override
  AppSpacing copyWith({ThemeData? theme}) {
    return this;
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) return this;
    return this;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSpacing;
  }

  @override
  int get hashCode => runtimeType.hashCode;
} 