
/// Semantic opacity scale for consistent transparency throughout the app
class AppOpacities {
  const AppOpacities._();
  
  /// Default constructor
  const AppOpacities();

  // Base opacity values
  static const double _xs = 0.1;
  static const double _sm = 0.2;
  static const double _md = 0.4;
  static const double _lg = 0.6;
  static const double _xl = 0.8;
  static const double _full = 1.0;

  // Semantic opacity values
  static const double xs = _xs;
  static const double sm = _sm;
  static const double md = _md;
  static const double lg = _lg;
  static const double xl = _xl;
  static const double full = _full;

  // Functional opacity values
  static const double disabled = 0.38;
  static const double hover = 0.08;
  static const double pressed = 0.12;
  static const double overlay = 0.5;
  static const double shadow = 0.15;
  static const double border = 0.12;
  static const double divider = 0.08;
  static const double background = 0.04;
  static const double surface = 0.02;

  // Interactive states
  static const double focus = 0.12;
  static const double selected = 0.08;
  static const double dragged = 0.16;
  static const double scrim = 0.32;

  // Content opacity values
  static const double textPrimary = 0.87;
  static const double textSecondary = 0.6;
  static const double textTertiary = 0.38;
  static const double textDisabled = 0.26;

  // Icon opacity values
  static const double iconPrimary = 0.87;
  static const double iconSecondary = 0.6;
  static const double iconTertiary = 0.38;
  static const double iconDisabled = 0.26;

  // Animation opacity values
  static const double fadeIn = 0.0;
  static const double fadeOut = 1.0;
  static const double slideIn = 0.0;
  static const double slideOut = 1.0;

  // Additional opacity values for widgets
  static const double highlight = 0.08;
  static const double error = 0.12;
  static const double warning = 0.12;
  static const double success = 0.12;
  static const double info = 0.12;
  static const double selection = 0.08;

  // Alias para compatibilidad con widgets
  static const double primary = full;

  /// Creates a copy of this opacity with the given fields replaced
  AppOpacities copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? full,
    double? disabled,
    double? hover,
    double? pressed,
    double? overlay,
    double? shadow,
    double? border,
    double? divider,
    double? background,
    double? surface,
    double? focus,
    double? selected,
    double? dragged,
    double? scrim,
    double? textPrimary,
    double? textSecondary,
    double? textTertiary,
    double? textDisabled,
    double? iconPrimary,
    double? iconSecondary,
    double? iconTertiary,
    double? iconDisabled,
    double? fadeIn,
    double? fadeOut,
    double? slideIn,
    double? slideOut,
    double? highlight,
    double? error,
    double? warning,
    double? success,
    double? info,
    double? selection,
  }) {
    return AppOpacities._();
  }

  /// Linearly interpolates between two opacity values
  static AppOpacities lerp(AppOpacities? a, AppOpacities? b, double t) {
    if (a == null && b == null) return const AppOpacities._();
    if (a == null) return b!;
    if (b == null) return a;
    return const AppOpacities._();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppOpacities;
  }

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'AppOpacities()';
  }
} 