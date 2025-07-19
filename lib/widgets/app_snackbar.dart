import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_icons.dart';
import '../theme/app_sizes.dart';
import '../theme/app_opacities.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/extensions/context_extensions.dart';

/// Premium snackbar widget with complete theme integration
class AppSnackbar extends StatelessWidget {
  const AppSnackbar({
    super.key,
    required this.message,
    this.title,
    this.variant = AppSnackbarVariant.info,
    this.duration = const Duration(seconds: 4),
    this.action,
    this.onDismiss,
    this.showCloseButton = true,
    this.isPersistent = false,
  });

  final String message;
  final String? title;
  final AppSnackbarVariant variant;
  final Duration duration;
  final SnackBarAction? action;
  final VoidCallback? onDismiss;
  final bool showCloseButton;
  final bool isPersistent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    // Get colors based on variant
    final backgroundColor = _getBackgroundColor(context);
    final textColor = _getTextColor(context);
    final iconColor = _getIconColor(context);
    
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadius.defaultRadius.mdRadius,
        boxShadow: [
          BoxShadow(
            color: colors.overlay.withValues(alpha: AppOpacities.shadow),
            blurRadius: AppSizes.shadowRadius,
            offset: Offset(0, AppSizes.shadowOffset),
          ),
        ],
      ),
      child: Padding(
        padding: AppSpacing.mdPadding,
        child: Row(
          children: [
            // Icon
            Icon(
              _getIcon(),
              size: AppSizes.iconSizeMd,
              color: iconColor,
            ),
            AppSpacing.mdHorizontalGap,
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null) ...[
                    Text(
                      title!,
                      style: textStyle.label.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppSpacing.xsVerticalGap,
                  ],
                  Text(
                    message,
                    style: textStyle.body2.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            
            // Action button
            if (action != null) ...[
              AppSpacing.smHorizontalGap,
              _buildActionButton(context, action!),
            ],
            
            // Close button
            if (showCloseButton) ...[
              AppSpacing.smHorizontalGap,
              _buildCloseButton(context, textColor),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (variant) {
      case AppSnackbarVariant.success:
        return AppIcons.success;
      case AppSnackbarVariant.error:
        return AppIcons.error;
      case AppSnackbarVariant.warning:
        return AppIcons.warning;
      case AppSnackbarVariant.info:
        return AppIcons.info;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    final colors = context.colors;
    
    switch (variant) {
      case AppSnackbarVariant.success:
        return colors.success.withValues(alpha: AppOpacities.highlight);
      case AppSnackbarVariant.error:
        return colors.error.withValues(alpha: AppOpacities.highlight);
      case AppSnackbarVariant.warning:
        return colors.warning.withValues(alpha: AppOpacities.highlight);
      case AppSnackbarVariant.info:
        return colors.info.withValues(alpha: AppOpacities.highlight);
    }
  }

  Color _getTextColor(BuildContext context) {
    final colors = context.colors;
    
    switch (variant) {
      case AppSnackbarVariant.success:
        return colors.success;
      case AppSnackbarVariant.error:
        return colors.error;
      case AppSnackbarVariant.warning:
        return colors.warning;
      case AppSnackbarVariant.info:
        return colors.info;
    }
  }

  Color _getIconColor(BuildContext context) {
    return _getTextColor(context);
  }

  Widget _buildActionButton(BuildContext context, SnackBarAction action) {
    final textStyle = context.textStyle;
    
    return TextButton(
      onPressed: action.onPressed,
      style: TextButton.styleFrom(
        foregroundColor: _getTextColor(context),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.inputPadding,
          vertical: AppSizes.inputPadding / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputBorderRadius),
        ),
      ),
      child: Text(
        action.label,
        style: textStyle.button.copyWith(
          color: _getTextColor(context),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context, Color textColor) {
    return IconButton(
      onPressed: onDismiss,
      icon: Icon(
        AppIcons.close,
        size: AppSizes.iconSizeSm,
        color: textColor,
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: AppSizes.iconSizeMd,
        minHeight: AppSizes.iconSizeMd,
      ),
    );
  }
}

/// Snackbar variant enum
enum AppSnackbarVariant {
  success,
  error,
  warning,
  info,
}

/// Extension to show snackbars easily
extension AppSnackbarExtension on BuildContext {
  /// Show a snackbar with the given message and variant
  void showSnackbar({
    required String message,
    String? title,
    AppSnackbarVariant variant = AppSnackbarVariant.info,
    Duration? duration,
    SnackBarAction? action,
    VoidCallback? onDismiss,
    bool showCloseButton = true,
    bool isPersistent = false,
  }) {
    final snackBar = SnackBar(
      content: AppSnackbar(
        message: message,
        title: title,
        variant: variant,
        duration: duration ?? const Duration(seconds: 4),
        action: action,
        onDismiss: onDismiss,
        showCloseButton: showCloseButton,
        isPersistent: isPersistent,
      ),
              backgroundColor: colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: isPersistent ? const Duration(days: 365) : (duration ?? const Duration(seconds: 4)),
      margin: EdgeInsets.all(AppSizes.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  /// Show a success snackbar
  void showSuccessSnackbar({
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
  }) {
    showSnackbar(
      message: message,
      title: title,
      variant: AppSnackbarVariant.success,
      duration: duration,
      action: action,
    );
  }

  /// Show an error snackbar
  void showErrorSnackbar({
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
  }) {
    showSnackbar(
      message: message,
      title: title,
      variant: AppSnackbarVariant.error,
      duration: duration,
      action: action,
    );
  }

  /// Show a warning snackbar
  void showWarningSnackbar({
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
  }) {
    showSnackbar(
      message: message,
      title: title,
      variant: AppSnackbarVariant.warning,
      duration: duration,
      action: action,
    );
  }

  /// Show an info snackbar
  void showInfoSnackbar({
    required String message,
    String? title,
    Duration? duration,
    SnackBarAction? action,
  }) {
    showSnackbar(
      message: message,
      title: title,
      variant: AppSnackbarVariant.info,
      duration: duration,
      action: action,
    );
  }

  /// Hide all snackbars
  void hideSnackbars() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
} 