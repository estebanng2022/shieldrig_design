import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_sizes.dart';
import '../theme/extensions/context_extensions.dart';

/// Premium divider widget with complete theme integration
/// Provides a consistent way to separate content with customizable styling
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.orientation = Axis.horizontal,
    this.color,
    this.thickness,
    this.length,
    this.margin,
    this.radius,
  });

  final Axis orientation;
  final Color? color;
  final double? thickness;
  final double? length;
  final EdgeInsets? margin;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    // Get colors from theme
    final dividerColor = color ?? context.colors.divider;
    
    // Get thickness from theme
    final dividerThickness = thickness ?? AppSizes.dividerHeight;
    
    // Get margin from theme or default
    final dividerMargin = margin ?? EdgeInsets.zero;
    
    // Get radius from theme or default
    final dividerRadius = radius ?? BorderRadius.zero;

    Widget divider = Container(
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: dividerRadius,
      ),
    );

    // Apply orientation-specific sizing
    if (orientation == Axis.horizontal) {
      divider = Container(
        height: dividerThickness,
        width: length,
        decoration: BoxDecoration(
          color: dividerColor,
          borderRadius: dividerRadius,
        ),
      );
    } else {
      divider = Container(
        width: dividerThickness,
        height: length,
        decoration: BoxDecoration(
          color: dividerColor,
          borderRadius: dividerRadius,
        ),
      );
    }

    // Apply margin if provided
    if (dividerMargin != EdgeInsets.zero) {
      divider = Container(
        margin: dividerMargin,
        child: divider,
      );
    }

    return divider;
  }
} 