import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_sizes.dart';
import '../theme/app_opacities.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/extensions/context_extensions.dart';


/// Premium card widget with complete theme integration
/// 
/// Purely visual wrapper for styling and structure (padding, border, background, etc.)
/// For dynamic content, use functional widgets like AppContentSection, AppFormSection, etc.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.elevated,
    this.padding,
    this.margin,
    this.borderRadius,
    this.elevation,
    this.isDisabled = false,
    this.isHovered = false,
    this.isSelected = false,
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
  });

  /// Child widget to display inside the card
  final Widget child;
  
  final AppCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double? elevation;
  final bool isDisabled;
  final bool isHovered;
  final bool isSelected;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    // Get default padding based on theme
    final cardPadding = padding ?? AppSpacing.smPadding;
    
    // Get default margin
    final cardMargin = margin ?? EdgeInsets.zero;
    
    // Get border radius
    final cardBorderRadius = borderRadius ?? AppRadius.defaultRadius.mdRadius;
    
    // Get elevation based on variant
    final cardElevation = _getElevation(context);
    
    // Get colors based on state and variant
    final cardColor = _getCardColor(context);
    final cardBorderColor = _getBorderColor(context);
    final cardShadowColor = _getShadowColor(context);
    
    Widget cardContent = Container(
      padding: cardPadding,
      decoration: _buildDecoration(
        context,
        cardColor,
        cardBorderColor,
        cardShadowColor,
        cardBorderRadius,
        cardElevation,
      ),
      child: child,
    );
    
    // Wrap with gesture detector if onTap or onLongPress is provided
    if (onTap != null || onLongPress != null) {
      cardContent = GestureDetector(
        onTap: isDisabled ? null : onTap,
        onLongPress: isDisabled ? null : onLongPress,
        child: cardContent,
      );
    }
    
    // Wrap with container for margin
    if (cardMargin != EdgeInsets.zero) {
      cardContent = Container(
        margin: cardMargin,
        child: cardContent,
      );
    }
    
    return cardContent;
  }

  BoxDecoration _buildDecoration(
    BuildContext context,
    Color backgroundColor,
    Color borderColor,
    Color shadowColor,
    BorderRadius borderRadius,
    double elevation,
  ) {
    
    List<BoxShadow>? shadows;
    if (elevation > 0) {
      shadows = [
        BoxShadow(
          color: shadowColor.withValues(alpha: AppOpacities.shadow),
          blurRadius: AppSizes.shadowRadius * elevation,
          offset: Offset(0, AppSizes.shadowOffset * elevation),
        ),
      ];
    }
    
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
      border: _getBorder(borderColor),
      boxShadow: shadows,
    );
  }

  Border? _getBorder(Color borderColor) {
    switch (variant) {
      case AppCardVariant.elevated:
      case AppCardVariant.flat:
        return null;
      case AppCardVariant.outline:
      case AppCardVariant.bordered:
        return Border.all(
          color: borderColor,
          width: AppSizes.borderWidth,
        );
    }
  }

  Color _getCardColor(BuildContext context) {
    final colors = context.colors;
    
    // Custom backgroundColor takes precedence
    if (backgroundColor != null) {
      return backgroundColor!;
    }
    
    // Base color based on variant
    Color baseColor;
    switch (variant) {
      case AppCardVariant.elevated:
      case AppCardVariant.flat:
        baseColor = colors.surface;
        break;
      case AppCardVariant.outline:
        baseColor = colors.surface;
        break;
      case AppCardVariant.bordered:
        baseColor = colors.surface;
        break;
    }
    
    // Apply state modifiers
    if (isDisabled) {
      return baseColor.withValues(alpha: AppOpacities.disabled);
    }
    
    if (isSelected) {
      return baseColor.withValues(alpha: AppOpacities.selection);
    }
    
    if (isHovered) {
      return baseColor.withValues(alpha: AppOpacities.hover);
    }
    
    return baseColor;
  }

  Color _getBorderColor(BuildContext context) {
    final colors = context.colors;
    
    // Custom border color takes precedence
    if (borderColor != null) {
      return borderColor!;
    }
    
    // Default border color based on state
    if (isDisabled) {
      return colors.disabled;
    }
    
    if (isSelected) {
      return colors.primary;
    }
    
    if (isHovered) {
      return colors.primary;
    }
    
    return colors.outline;
  }

  Color _getShadowColor(BuildContext context) {
    final colors = context.colors;
    
    // Custom shadow color takes precedence
    if (shadowColor != null) {
      return shadowColor!;
    }
    
    return colors.overlay;
  }

  double _getElevation(BuildContext context) {
    // Custom elevation takes precedence
    if (elevation != null) {
      return elevation!;
    }
    
    // Default elevation based on variant
    switch (variant) {
      case AppCardVariant.elevated:
        return AppSizes.elevationMd;
      case AppCardVariant.flat:
        return 0.0;
      case AppCardVariant.outline:
        return 0.0;
      case AppCardVariant.bordered:
        return 0.0;
    }
  }
}

/// Card variant enum
enum AppCardVariant {
  elevated,
  flat,
  outline,
  bordered,
} 