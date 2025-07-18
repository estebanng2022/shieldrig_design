import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Semantic text style scale for consistent typography throughout the app
class AppTextStyle extends ThemeExtension<AppTextStyle> {
  const AppTextStyle._({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.heading5,
    required this.heading6,
    required this.body1,
    required this.body2,
    required this.caption,
    required this.overline,
    required this.button,
    required this.label,
  });

  // Default text styles
  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle heading4;
  final TextStyle heading5;
  final TextStyle heading6;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle caption;
  final TextStyle overline;
  final TextStyle button;
  final TextStyle label;

  // Default instance with Inter font
  static const AppTextStyle _default = AppTextStyle._(
    heading1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      height: 1.2,
    ),
    heading2: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.25,
      height: 1.3,
    ),
    heading3: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
      height: 1.3,
    ),
    heading4: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.4,
    ),
    heading5: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
      height: 1.4,
    ),
    heading6: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
    ),
    body1: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    body2: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.4,
    ),
    caption: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.3,
    ),
    overline: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      height: 1.2,
    ),
    button: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      height: 1.4,
    ),
    label: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.3,
    ),
  );

  /// Default text style instance
  static const AppTextStyle defaultTextStyle = _default;

  /// Creates text styles with Inter font applied
  static AppTextStyle withInter() {
    return AppTextStyle._(
      heading1: GoogleFonts.inter(textStyle: _default.heading1),
      heading2: GoogleFonts.inter(textStyle: _default.heading2),
      heading3: GoogleFonts.inter(textStyle: _default.heading3),
      heading4: GoogleFonts.inter(textStyle: _default.heading4),
      heading5: GoogleFonts.inter(textStyle: _default.heading5),
      heading6: GoogleFonts.inter(textStyle: _default.heading6),
      body1: GoogleFonts.inter(textStyle: _default.body1),
      body2: GoogleFonts.inter(textStyle: _default.body2),
      caption: GoogleFonts.inter(textStyle: _default.caption),
      overline: GoogleFonts.inter(textStyle: _default.overline),
      button: GoogleFonts.inter(textStyle: _default.button),
      label: GoogleFonts.inter(textStyle: _default.label),
    );
  }

  /// Creates a copy of this text style with the given fields replaced
  AppTextStyle copyWithTextStyle({
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? heading6,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? caption,
    TextStyle? overline,
    TextStyle? button,
    TextStyle? label,
  }) {
    return AppTextStyle._(
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      heading5: heading5 ?? this.heading5,
      heading6: heading6 ?? this.heading6,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
      button: button ?? this.button,
      label: label ?? this.label,
    );
  }

  /// Linearly interpolates between two text styles
  static AppTextStyle lerpTextStyle(AppTextStyle? a, AppTextStyle? b, double t) {
    if (a == null && b == null) return defaultTextStyle;
    if (a == null) return b!;
    if (b == null) return a;

    return AppTextStyle._(
      heading1: TextStyle.lerp(a.heading1, b.heading1, t) ?? a.heading1,
      heading2: TextStyle.lerp(a.heading2, b.heading2, t) ?? a.heading2,
      heading3: TextStyle.lerp(a.heading3, b.heading3, t) ?? a.heading3,
      heading4: TextStyle.lerp(a.heading4, b.heading4, t) ?? a.heading4,
      heading5: TextStyle.lerp(a.heading5, b.heading5, t) ?? a.heading5,
      heading6: TextStyle.lerp(a.heading6, b.heading6, t) ?? a.heading6,
      body1: TextStyle.lerp(a.body1, b.body1, t) ?? a.body1,
      body2: TextStyle.lerp(a.body2, b.body2, t) ?? a.body2,
      caption: TextStyle.lerp(a.caption, b.caption, t) ?? a.caption,
      overline: TextStyle.lerp(a.overline, b.overline, t) ?? a.overline,
      button: TextStyle.lerp(a.button, b.button, t) ?? a.button,
      label: TextStyle.lerp(a.label, b.label, t) ?? a.label,
    );
  }

  @override
  AppTextStyle copyWith({ThemeData? theme}) {
    return this;
  }

  @override
  AppTextStyle lerp(ThemeExtension<AppTextStyle>? other, double t) {
    if (other is! AppTextStyle) return this;
    return AppTextStyle.lerpTextStyle(this, other, t);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppTextStyle &&
        other.heading1 == heading1 &&
        other.heading2 == heading2 &&
        other.heading3 == heading3 &&
        other.heading4 == heading4 &&
        other.heading5 == heading5 &&
        other.heading6 == heading6 &&
        other.body1 == body1 &&
        other.body2 == body2 &&
        other.caption == caption &&
        other.overline == overline &&
        other.button == button &&
        other.label == label;
  }

  @override
  int get hashCode {
    return Object.hash(
      heading1,
      heading2,
      heading3,
      heading4,
      heading5,
      heading6,
      body1,
      body2,
      caption,
      overline,
      button,
      label,
    );
  }

  @override
  String toString() {
    return 'AppTextStyle(heading1: $heading1, heading2: $heading2, heading3: $heading3, heading4: $heading4, heading5: $heading5, heading6: $heading6, body1: $body1, body2: $body2, caption: $caption, overline: $overline, button: $button, label: $label)';
  }
} 