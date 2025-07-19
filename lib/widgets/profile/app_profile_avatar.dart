import 'package:flutter/material.dart';
import '../../theme/extensions/context_extensions.dart';
import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';

/// Profile avatar widget for displaying user images or initials
/// 
/// Supports circular and rectangular shapes with optional edit functionality
class AppProfileAvatar extends StatelessWidget {
  const AppProfileAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 72.0,
    this.isEditable = false,
    this.onEditTap,
    this.shape = BoxShape.circle,
    this.borderRadius,
    this.backgroundColor,
    this.textStyle,
  });

  /// URL of the profile image
  final String? imageUrl;

  /// Initials to display when no image is provided
  final String? initials;

  /// Size of the avatar (width and height)
  final double size;

  /// Whether to show edit icon overlay
  final bool isEditable;

  /// Callback when edit icon is tapped
  final VoidCallback? onEditTap;

  /// Shape of the avatar
  final BoxShape shape;

  /// Border radius for rectangular shape
  final BorderRadius? borderRadius;

  /// Background color for initials
  final Color? backgroundColor;

  /// Text style for initials
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    // Default background color for initials
    final defaultBackgroundColor = backgroundColor ?? colors.surface;
    
    // Default text style for initials
    final defaultTextStyle = textStyle ?? context.textStyle.body1.copyWith(
      color: colors.primaryText,
      fontWeight: FontWeight.w600,
    );

    // Calculate border radius based on shape
    final effectiveBorderRadius = shape == BoxShape.circle
        ? BorderRadius.circular(size / 2)
        : borderRadius ?? AppRadius.defaultRadius.mdRadius;

    Widget avatarWidget;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      // Show image
      avatarWidget = ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: Image.network(
          imageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildInitialsContainer(
              context,
              defaultBackgroundColor,
              defaultTextStyle,
              effectiveBorderRadius,
            );
          },
        ),
      );
    } else {
      // Show initials
      avatarWidget = _buildInitialsContainer(
        context,
        defaultBackgroundColor,
        defaultTextStyle,
        effectiveBorderRadius,
      );
    }

    // Wrap with edit overlay if editable
    if (isEditable) {
      avatarWidget = Stack(
        children: [
          avatarWidget,
          Positioned(
            right: AppSpacing.xs,
            bottom: AppSpacing.xs,
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                width: AppSpacing.md,
                height: AppSpacing.md,
                decoration: BoxDecoration(
                  color: colors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colors.overlay,
                      blurRadius: AppSpacing.xs,
                      offset: Offset(0, AppSpacing.xs / 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.edit,
                  size: AppSpacing.sm,
                  color: colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: avatarWidget,
    );
  }

  /// Build initials container
  Widget _buildInitialsContainer(
    BuildContext context,
    Color backgroundColor,
    TextStyle textStyle,
    BorderRadius borderRadius,
  ) {
    final colors = context.colors;
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.2),
          width: AppSpacing.xs / 4, // Use theme spacing instead of hardcoded 1
        ),
      ),
      child: Center(
        child: Text(
          initials ?? '?',
          style: textStyle.copyWith(
            fontSize: size * 0.4,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
} 