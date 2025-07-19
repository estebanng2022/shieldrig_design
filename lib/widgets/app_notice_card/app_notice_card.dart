import 'package:flutter/material.dart';
import '../app_card.dart';
import '../app_content_section.dart';
import '../../theme/extensions/context_extensions.dart';
import '../../theme/app_opacities.dart';

/// Notice card widget for displaying informational, warning, success, or error messages
/// 
/// Uses hybrid composition: AppCard (base) + AppContentSection (structure) + AppSnackbar logic (colors/icons)
class AppNoticeCard extends StatelessWidget {
  const AppNoticeCard({
    super.key,
    required this.title,
    this.subtitle,
    this.variant = AppNoticeVariant.info,
    this.onTap,
    this.showClose = false,
    this.onClose,
  });

  /// Notice title (required)
  final String title;

  /// Notice subtitle (optional)
  final String? subtitle;

  /// Notice variant that determines colors and icon
  final AppNoticeVariant variant;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Whether to show close button
  final bool showClose;

  /// Callback when close button is tapped
  final VoidCallback? onClose;

  /// Fixed height for consistency
  static const double height = 96.0;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      variant: AppCardVariant.flat,
      backgroundColor: _getBackgroundColor(context),
      onTap: onTap,
      child: AppContentSection(
        variant: AppContentSectionVariant.compact,
        title: title,
        subtitle: subtitle,
        headerIcon: _getIcon(context),
        headerAction: showClose ? _buildCloseButton(context) : null,
        child: const SizedBox.shrink(), // No child needed, content in header
      ),
    );
  }

  /// Get background color based on variant
  Color _getBackgroundColor(BuildContext context) {
    final colors = context.colors;
    
    switch (variant) {
      case AppNoticeVariant.info:
        return colors.info.withValues(alpha: AppOpacities.info);
      case AppNoticeVariant.success:
        return colors.success.withValues(alpha: AppOpacities.success);
      case AppNoticeVariant.warning:
        return colors.warning.withValues(alpha: AppOpacities.warning);
      case AppNoticeVariant.error:
        return colors.error.withValues(alpha: AppOpacities.error);
      case AppNoticeVariant.neutral:
        return colors.surface.withValues(alpha: AppOpacities.surface);
    }
  }

  /// Get icon based on variant
  IconData? _getIcon(BuildContext context) {
    switch (variant) {
      case AppNoticeVariant.info:
        return Icons.info_outline;
      case AppNoticeVariant.success:
        return Icons.check_circle_outline;
      case AppNoticeVariant.warning:
        return Icons.warning_amber_outlined;
      case AppNoticeVariant.error:
        return Icons.error_outline;
      case AppNoticeVariant.neutral:
        return null; // No icon for neutral
    }
  }

  /// Build close button widget
  Widget _buildCloseButton(BuildContext context) {
    return IconButton(
      onPressed: onClose,
      icon: const Icon(Icons.close, size: 20),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(
        minWidth: 24,
        minHeight: 24,
      ),
    );
  }
}

/// Notice variant enum
enum AppNoticeVariant {
  info,
  success,
  warning,
  error,
  neutral,
} 