import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/extensions/context_extensions.dart';

/// A customizable interactive box widget with visual feedback and selection states.
/// 
/// This widget provides a clickable container with customizable colors, borders,
/// and selection states. It uses the design system's spacing and radius values
/// and integrates with the app's theme.
class AppInteractiveBox extends StatelessWidget {
  /// The child widget to display inside the box.
  final Widget child;

  /// Callback function triggered when the box is tapped.
  final VoidCallback? onTap;

  /// Whether the box is in a selected state.
  final bool isSelected;

  /// The border color when not selected.
  final Color? borderColor;

  /// The border color when selected.
  final Color? selectedBorderColor;

  /// The background color when not selected.
  final Color? backgroundColor;

  /// The background color when selected.
  final Color? selectedColor;

  /// The width of the box.
  final double? width;

  /// The height of the box.
  final double? height;

  /// The alignment of the child within the box.
  final AlignmentGeometry? alignment;

  /// Whether the box is disabled.
  final bool disabled;

  /// Creates an [AppInteractiveBox].
  const AppInteractiveBox({
    super.key,
    required this.child,
    this.onTap,
    this.isSelected = false,
    this.borderColor,
    this.selectedBorderColor,
    this.backgroundColor,
    this.selectedColor,
    this.width,
    this.height,
    this.alignment,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final effectiveBorderColor = isSelected
        ? (selectedBorderColor ?? colors.primary)
        : (borderColor ?? colors.outline);

    final effectiveBackgroundColor = isSelected
        ? (selectedColor ?? colors.primaryContainer)
        : (backgroundColor ?? colors.surface);

    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.defaultRadius.md),
          border: Border.all(
            color: effectiveBorderColor,
            width: AppSizes.borderWidth,
          ),
        ),
        child: Material(
          color: context.colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.defaultRadius.md),
            onTap: disabled ? null : onTap,
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
} 