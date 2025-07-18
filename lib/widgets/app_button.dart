import 'package:flutter/material.dart';
import '../theme/extensions/context_extensions.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/app_opacities.dart';
import '../theme/app_radius.dart';

/// Premium button widget with multiple variants and states
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.label = '',
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.iconPosition = AppButtonIconPosition.leading,
    this.width,
    this.height,
  });

  final VoidCallback? onPressed;
  final String label;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final AppButtonIconPosition iconPosition;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (onPressed != null && !isLoading && !isDisabled) ? onPressed : null,
      child: Container(
        width: width ?? _getButtonWidth(context),
        height: height ?? _getButtonHeight(context),
        decoration: _getBoxDecoration(context),
        child: Material(
          color: context.colors.transparent,
          child: InkWell(
            borderRadius: AppRadius.defaultRadius.mdRadius,
            onTap: (onPressed != null && !isLoading && !isDisabled) ? onPressed : null,
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration(BuildContext context) {
    final colors = context.colors;
    
    switch (variant) {
      case AppButtonVariant.primary:
        return BoxDecoration(
          color: colors.primary,
          borderRadius: AppRadius.defaultRadius.mdRadius,
          boxShadow: [
            BoxShadow(
              color: colors.primary.withValues(alpha: AppOpacities.shadow),
              blurRadius: AppSizes.shadowRadius,
              offset: Offset(0, AppSizes.shadowOffset),
            ),
          ],
        );
      case AppButtonVariant.secondary:
        return BoxDecoration(
          color: colors.surface,
          borderRadius: AppRadius.defaultRadius.mdRadius,
          border: Border.all(
            color: colors.outline,
            width: AppSizes.borderWidth,
          ),
        );
      case AppButtonVariant.ghost:
        return BoxDecoration(
          color: context.colors.transparent,
          borderRadius: AppRadius.defaultRadius.mdRadius,
        );
      case AppButtonVariant.text:
        return BoxDecoration(
          color: context.colors.transparent,
        );
      case AppButtonVariant.danger:
        return BoxDecoration(
          color: colors.error,
          borderRadius: AppRadius.defaultRadius.mdRadius,
          boxShadow: [
            BoxShadow(
              color: colors.error.withValues(alpha: AppOpacities.shadow),
              blurRadius: AppSizes.shadowRadius,
              offset: Offset(0, AppSizes.shadowOffset),
            ),
          ],
        );
    }
  }

  Widget _buildContent(BuildContext context) {
    
    // Get text style based on variant and size
    final buttonTextStyle = _getTextStyle(context);
    
    // Get text color based on variant
    final textColor = _getTextColor(context);
    
    // Get content padding based on size
    final contentPadding = _getContentPadding(context);
    
    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: AppSizes.iconSizeSm,
            height: AppSizes.iconSizeSm,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
          AppSpacing.smHorizontalGap,
        ] else if (icon != null && iconPosition == AppButtonIconPosition.leading) ...[
          Icon(
            icon,
            size: _getIconSize(context),
            color: textColor,
          ),
          AppSpacing.smHorizontalGap,
        ],
        
        Text(
          label,
          style: buttonTextStyle.copyWith(color: textColor),
        ),
        
        if (icon != null && iconPosition == AppButtonIconPosition.trailing) ...[
          AppSpacing.smHorizontalGap,
          Icon(
            icon,
            size: _getIconSize(context),
            color: textColor,
          ),
        ],
      ],
    );
    
    return Container(
      width: _getButtonWidth(context),
      height: _getButtonHeight(context),
      padding: contentPadding,
      child: Center(child: content),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    final textStyle = context.textStyle;
    
    switch (size) {
      case AppButtonSize.sm:
        return textStyle.caption;
      case AppButtonSize.md:
        return textStyle.button;
      case AppButtonSize.lg:
        return textStyle.body1;
    }
  }

  Color _getTextColor(BuildContext context) {
    final colors = context.colors;
    final isEnabled = onPressed != null && !isLoading && !isDisabled;
    
    if (!isEnabled) {
      return colors.textTertiary;
    }
    
    switch (variant) {
      case AppButtonVariant.primary:
        return context.colors.white;
      case AppButtonVariant.secondary:
      case AppButtonVariant.ghost:
      case AppButtonVariant.text:
        return colors.textPrimary;
      case AppButtonVariant.danger:
        return context.colors.white;
    }
  }

  EdgeInsets _getContentPadding(BuildContext context) {
    switch (size) {
      case AppButtonSize.sm:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        );
      case AppButtonSize.md:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        );
      case AppButtonSize.lg:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        );
    }
  }

  double _getButtonHeight(BuildContext context) {
    switch (size) {
      case AppButtonSize.sm:
        return AppSizes.buttonHeightSm;
      case AppButtonSize.md:
        return AppSizes.buttonHeightMd;
      case AppButtonSize.lg:
        return AppSizes.buttonHeightLg;
    }
  }

  double? _getButtonWidth(BuildContext context) {
    // Return null for flexible width, or set specific width if needed
    return null;
  }

  double _getIconSize(BuildContext context) {
    switch (size) {
      case AppButtonSize.sm:
        return AppSizes.iconSizeSm;
      case AppButtonSize.md:
        return AppSizes.iconSizeMd;
      case AppButtonSize.lg:
        return AppSizes.iconSizeLg;
    }
  }
}

/// Button variant enum
enum AppButtonVariant {
  primary,
  secondary,
  ghost,
  text,
  danger,
}

/// Button size enum
enum AppButtonSize {
  sm,
  md,
  lg,
}

/// Icon position enum
enum AppButtonIconPosition {
  leading,
  trailing,
} 