import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_spacing.dart';
import '../theme/app_radius.dart';
import '../theme/app_opacities.dart';
import '../theme/app_sizes.dart';
import '../theme/app_icons.dart';
import '../theme/extensions/context_extensions.dart';

/// Premium content section widget for dividing content within AppCard
class AppContentSection extends StatelessWidget {
  const AppContentSection({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.variant = AppContentSectionVariant.spaced,
    this.padding,
    this.margin,
    this.showDivider = false,
    this.isCollapsible = false,
    this.isExpanded = true,
    this.onToggle,
    this.headerIcon,
    this.headerAction,
    this.backgroundColor,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final AppContentSectionVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showDivider;
  final bool isCollapsible;
  final bool isExpanded;
  final VoidCallback? onToggle;
  final IconData? headerIcon;
  final Widget? headerAction;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    
    // Get section padding based on variant
    final sectionPadding = _getSectionPadding(context);
    
    // Get section margin
    final sectionMargin = margin ?? EdgeInsets.zero;
    
    // Get background color
    final sectionBackgroundColor = backgroundColor ?? _getBackgroundColor(context);
    
    Widget sectionContent = Container(
      padding: sectionPadding,
      decoration: BoxDecoration(
        color: sectionBackgroundColor,
        borderRadius: _getBorderRadius(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (if title is provided)
          if (title != null) ...[
            _buildHeader(context),
            if (variant != AppContentSectionVariant.compact) AppSpacing.smVerticalGap,
          ],
          
          // Content
          if (isExpanded || !isCollapsible) child,
        ],
      ),
    );
    
    // Add divider if requested
    if (showDivider) {
      sectionContent = Column(
        children: [
          sectionContent,
          _buildDivider(context),
        ],
      );
    }
    
    // Wrap with margin container if needed
    if (sectionMargin != EdgeInsets.zero) {
      sectionContent = Container(
        margin: sectionMargin,
        child: sectionContent,
      );
    }
    
    return sectionContent;
  }

  Widget _buildHeader(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    return Row(
      children: [
        // Icon (if provided)
        if (headerIcon != null) ...[
          Icon(
            headerIcon,
            size: AppSizes.iconSizeMd,
            color: colors.secondaryText,
          ),
          AppSpacing.smHorizontalGap,
        ],
        
        // Title and subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: textStyle.heading6.copyWith(
                  color: colors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (subtitle != null) ...[
                AppSpacing.xsVerticalGap,
                Text(
                  subtitle!,
                  style: textStyle.caption.copyWith(
                    color: colors.secondaryText,
                  ),
                ),
              ],
            ],
          ),
        ),
        
        // Toggle button (if collapsible)
        if (isCollapsible) ...[
          AppSpacing.smHorizontalGap,
          IconButton(
            onPressed: onToggle,
            icon: Icon(
              isExpanded ? AppIcons.up : AppIcons.down,
              size: AppSizes.iconSizeSm,
              color: colors.secondaryText,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: AppSizes.iconSizeMd,
              minHeight: AppSizes.iconSizeMd,
            ),
          ),
        ],
        
        // Header action (if provided)
        if (headerAction != null) ...[
          AppSpacing.smHorizontalGap,
          headerAction!,
        ],
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      height: AppSizes.dividerHeight,
      color: colors.outline,
    );
  }

  EdgeInsets _getSectionPadding(BuildContext context) {
    
    // Custom padding takes precedence
    if (padding != null) {
      return padding! as EdgeInsets;
    }
    
    // Default padding based on variant
    switch (variant) {
      case AppContentSectionVariant.divider:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        );
      case AppContentSectionVariant.spaced:
        return AppSpacing.mdPadding;
      case AppContentSectionVariant.compact:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        );
      case AppContentSectionVariant.header:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        );
    }
  }

  BorderRadius _getBorderRadius(BuildContext context) {
    
    switch (variant) {
      case AppContentSectionVariant.divider:
        return BorderRadius.zero;
      case AppContentSectionVariant.spaced:
        return AppRadius.defaultRadius.smRadius;
      case AppContentSectionVariant.compact:
        return AppRadius.defaultRadius.xsRadius;
      case AppContentSectionVariant.header:
        return AppRadius.defaultRadius.mdRadius;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    final colors = context.colors;
    
    switch (variant) {
      case AppContentSectionVariant.divider:
        return context.colors.transparent;
      case AppContentSectionVariant.spaced:
        return colors.surface.withValues(alpha: AppOpacities.highlight);
      case AppContentSectionVariant.compact:
        return context.colors.transparent;
      case AppContentSectionVariant.header:
        return colors.surface.withValues(alpha: AppOpacities.highlight);
    }
  }
}

/// Content section variant enum
enum AppContentSectionVariant {
  divider,
  spaced,
  compact,
  header,
}



/// Convenience widget for compact sections
class AppCompactSection extends StatelessWidget {
  const AppCompactSection({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.padding,
    this.margin,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return AppContentSection(
      title: title,
      subtitle: subtitle,
      variant: AppContentSectionVariant.compact,
      padding: padding,
      margin: margin,
      child: child,
    );
  }
} 