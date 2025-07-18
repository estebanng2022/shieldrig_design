import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_icons.dart';
import '../theme/app_sizes.dart';
import '../theme/app_opacities.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/extensions/context_extensions.dart';

// Import widgets

/// Premium header section widget for modular page headers
class AppHeaderSection extends StatelessWidget {
  const AppHeaderSection({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.variant = AppHeaderVariant.standard,
    this.leadingIcon,
    this.leadingAction,
    this.trailingActions = const [],
    this.primaryAction,
    this.secondaryAction,
    this.showBackButton = false,
    this.onBackPressed,
    this.showDivider = false,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.isCompact = false,
  });

  final String? title;
  final String? subtitle;
  final String? description;
  final AppHeaderVariant variant;
  final IconData? leadingIcon;
  final VoidCallback? leadingAction;
  final List<Widget> trailingActions;
  final Widget? primaryAction;
  final Widget? secondaryAction;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool showDivider;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    // Get header padding based on variant and compact mode
    final headerPadding = _getHeaderPadding(context);
    
    // Get header margin
    final headerMargin = margin ?? EdgeInsets.zero;
    
    // Get background color
    final headerBackgroundColor = backgroundColor ?? _getBackgroundColor(context);
    
    // Get border radius
    final headerBorderRadius = borderRadius ?? _getBorderRadius(context);
    
    Widget headerContent = Container(
      padding: headerPadding,
      decoration: BoxDecoration(
        color: headerBackgroundColor,
        borderRadius: headerBorderRadius,
        boxShadow: elevation != null ? [
          BoxShadow(
            color: colors.overlay.withValues(alpha: AppOpacities.shadow),
            blurRadius: AppSizes.shadowRadius * elevation!,
            offset: Offset(0, AppSizes.shadowOffset),
          ),
        ] : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main header row
          Row(
            children: [
              // Leading section (back button, icon, or action)
              _buildLeadingSection(context),
              
              // Title and subtitle section
              Expanded(
                child: _buildTitleSection(context),
              ),
              
              // Trailing actions section
              _buildTrailingSection(context),
            ],
          ),
          
          // Description (if provided and not compact)
          if (description != null && !isCompact) ...[
            AppSpacing.smVerticalGap,
            _buildDescription(context),
          ],
          
          // Action buttons (if provided and not compact)
          if ((primaryAction != null || secondaryAction != null) && !isCompact) ...[
            AppSpacing.mdVerticalGap,
            _buildActionButtons(context),
          ],
        ],
      ),
    );
    
    // Add divider if requested
    if (showDivider) {
      headerContent = Column(
        children: [
          headerContent,
          _buildDivider(context),
        ],
      );
    }
    
    // Wrap with margin container if needed
    if (headerMargin != EdgeInsets.zero) {
      headerContent = Container(
        margin: headerMargin,
        child: headerContent,
      );
    }
    
    return headerContent;
  }

  Widget _buildLeadingSection(BuildContext context) {
    final colors = context.colors;
    
    // Back button
    if (showBackButton) {
      return IconButton(
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        icon: Icon(
          AppIcons.back,
          size: AppSizes.iconSizeMd,
          color: colors.textPrimary,
        ),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: AppSizes.iconSizeLg,
          minHeight: AppSizes.iconSizeLg,
        ),
      );
    }
    
    // Leading icon with action
    if (leadingIcon != null) {
      return IconButton(
        onPressed: leadingAction,
        icon: Icon(
          leadingIcon,
          size: AppSizes.iconSizeMd,
          color: colors.textSecondary,
        ),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: AppSizes.iconSizeLg,
          minHeight: AppSizes.iconSizeLg,
        ),
      );
    }
    
    return const SizedBox.shrink();
  }

  Widget _buildTitleSection(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: _getTitleStyle(context),
            maxLines: isCompact ? 1 : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        
        if (subtitle != null) ...[
          if (!isCompact) AppSpacing.xsVerticalGap,
          Text(
            subtitle!,
            style: textStyle.body2.copyWith(
              color: colors.textSecondary,
            ),
            maxLines: isCompact ? 1 : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _buildTrailingSection(BuildContext context) {
    
    if (trailingActions.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: trailingActions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;
        
        return Row(
          children: [
            action,
            if (index < trailingActions.length - 1) AppSpacing.smHorizontalGap,
          ],
        );
      }).toList(),
    );
  }

  Widget _buildDescription(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    return Text(
      description!,
      style: textStyle.body2.copyWith(
        color: colors.textSecondary,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    
    if (primaryAction == null && secondaryAction == null) {
      return const SizedBox.shrink();
    }
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (secondaryAction != null) ...[
          secondaryAction!,
          AppSpacing.smHorizontalGap,
        ],
        if (primaryAction != null) primaryAction!,
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    final colors = context.colors;
    
    return Container(
              margin: EdgeInsets.symmetric(vertical: AppSpacing.md),
      height: AppSizes.dividerHeight,
      color: colors.divider,
    );
  }

  TextStyle _getTitleStyle(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    switch (variant) {
      case AppHeaderVariant.standard:
        return textStyle.heading4.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w600,
        );
      case AppHeaderVariant.large:
        return textStyle.heading3.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w700,
        );
      case AppHeaderVariant.compact:
        return textStyle.heading6.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w600,
        );
      case AppHeaderVariant.minimal:
        return textStyle.body1.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w500,
        );
    }
  }

  EdgeInsets _getHeaderPadding(BuildContext context) {
    
    // Custom padding takes precedence
    if (padding != null) {
      return padding! as EdgeInsets;
    }
    
    // Default padding based on variant and compact mode
    if (isCompact) {
      return EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      );
    }
    
    switch (variant) {
      case AppHeaderVariant.standard:
        return AppSpacing.lgPadding;
      case AppHeaderVariant.large:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xl,
        );
      case AppHeaderVariant.compact:
        return AppSpacing.mdPadding;
      case AppHeaderVariant.minimal:
        return AppSpacing.smPadding;
    }
  }

  BorderRadius _getBorderRadius(BuildContext context) {
    
    switch (variant) {
      case AppHeaderVariant.standard:
        return AppRadius.defaultRadius.mdRadius;
      case AppHeaderVariant.large:
                  return AppRadius.defaultRadius.lgRadius;
      case AppHeaderVariant.compact:
                  return AppRadius.defaultRadius.smRadius;
      case AppHeaderVariant.minimal:
                  return AppRadius.defaultRadius.xsRadius;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    final colors = context.colors;
    
    switch (variant) {
      case AppHeaderVariant.standard:
        return colors.surface;
      case AppHeaderVariant.large:
        return colors.surface.withValues(alpha: AppOpacities.highlight);
      case AppHeaderVariant.compact:
        return Colors.transparent;
      case AppHeaderVariant.minimal:
        return Colors.transparent;
    }
  }
}

/// Header variant enum
enum AppHeaderVariant {
  standard,
  large,
  compact,
  minimal,
}

/// Convenience widget for page headers
class AppPageHeader extends StatelessWidget {
  const AppPageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    this.showBackButton = true,
    this.onBackPressed,
    this.trailingActions = const [],
    this.primaryAction,
    this.secondaryAction,
  });

  final String title;
  final String? subtitle;
  final String? description;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget> trailingActions;
  final Widget? primaryAction;
  final Widget? secondaryAction;

  @override
  Widget build(BuildContext context) {
    return AppHeaderSection(
      title: title,
      subtitle: subtitle,
      description: description,
      variant: AppHeaderVariant.standard,
      showBackButton: showBackButton,
      onBackPressed: onBackPressed,
      trailingActions: trailingActions,
      primaryAction: primaryAction,
      secondaryAction: secondaryAction,
    );
  }
}

/// Convenience widget for compact headers
class AppCompactHeader extends StatelessWidget {
  const AppCompactHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.onBackPressed,
    this.trailingActions = const [],
  });

  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget> trailingActions;

  @override
  Widget build(BuildContext context) {
    return AppHeaderSection(
      title: title,
      subtitle: subtitle,
      variant: AppHeaderVariant.compact,
      isCompact: true,
      showBackButton: showBackButton,
      onBackPressed: onBackPressed,
      trailingActions: trailingActions,
    );
  }
} 