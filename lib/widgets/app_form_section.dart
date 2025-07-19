import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_sizes.dart';
import '../theme/app_opacities.dart';
import '../theme/app_radius.dart';
import '../theme/app_icons.dart';
import '../theme/extensions/context_extensions.dart';
import '../theme/app_spacing.dart';

// Import widgets

/// Premium form section widget for complete forms with validation
class AppFormSection extends StatelessWidget {
  const AppFormSection({
    super.key,
    required this.children,
    this.title,
    this.subtitle,
    this.description,
    this.isRequired = false,
    this.isCollapsible = false,
    this.isExpanded = true,
    this.onToggle,
    this.headerIcon,
    this.headerAction,
    this.showDivider = true,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.validationErrors = const {},
  });

  final List<Widget> children;
  final String? title;
  final String? subtitle;
  final String? description;
  final bool isRequired;
  final bool isCollapsible;
  final bool isExpanded;
  final VoidCallback? onToggle;
  final IconData? headerIcon;
  final Widget? headerAction;
  final bool showDivider;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final Map<String, String> validationErrors;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    // Get section padding
    final sectionPadding = padding ?? AppSpacing.mdPadding;
    
    // Get section margin
    final sectionMargin = margin ?? EdgeInsets.zero;
    
    // Get background color
    final sectionBackgroundColor = backgroundColor ?? _getBackgroundColor(context);
    
    // Get border radius
    final sectionBorderRadius = borderRadius ?? AppRadius.defaultRadius.mdRadius;
    
    // Check if section has errors
    final hasErrors = validationErrors.isNotEmpty;
    
    Widget sectionContent = Container(
      padding: sectionPadding,
      decoration: BoxDecoration(
        color: sectionBackgroundColor,
        borderRadius: sectionBorderRadius,
        border: hasErrors ? Border.all(
          color: colors.error.withValues(alpha: AppOpacities.border),
          width: AppSizes.borderWidth,
        ) : null,
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
          // Header (if title is provided)
          if (title != null) ...[
            _buildHeader(context),
            AppSpacing.mdVerticalGap,
          ],
          
          // Description (if provided)
          if (description != null) ...[
            _buildDescription(context),
            AppSpacing.smVerticalGap,
          ],
          
          // Content
          if (isExpanded || !isCollapsible) ...[
            _buildFormFields(context),
            if (hasErrors) ...[
              AppSpacing.smVerticalGap,
              _buildValidationErrors(context),
            ],
          ],
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
            color: validationErrors.isNotEmpty ? colors.error : colors.secondaryText,
          ),
          AppSpacing.smHorizontalGap,
        ],
        
        // Title and subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title!,
                    style: textStyle.heading6.copyWith(
                      color: validationErrors.isNotEmpty ? colors.error : colors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (isRequired) ...[
                    AppSpacing.xsHorizontalGap,
                    Text(
                      '*',
                      style: textStyle.label.copyWith(
                        color: colors.error,
                      ),
                    ),
                  ],
                ],
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

  Widget _buildDescription(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    return Text(
      description!,
      style: textStyle.body2.copyWith(
        color: colors.secondaryText,
      ),
    );
  }

  Widget _buildFormFields(BuildContext context) {
    
    return Column(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;
        
        return Column(
          children: [
            child,
            if (index < children.length - 1) AppSpacing.smVerticalGap,
          ],
        );
      }).toList(),
    );
  }

  Widget _buildValidationErrors(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    return Container(
      padding: AppSpacing.smPadding,
      decoration: BoxDecoration(
        color: colors.error.withValues(alpha: AppOpacities.error),
        borderRadius: BorderRadius.circular(AppSizes.inputBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: validationErrors.entries.map((entry) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                AppIcons.error,
                size: AppSizes.iconSizeSm,
                color: colors.error,
              ),
              AppSpacing.xsHorizontalGap,
              Expanded(
                child: Text(
                  entry.value,
                  style: textStyle.caption.copyWith(
                    color: colors.error,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    final colors = context.colors;
    
    return Container(
              margin: EdgeInsets.symmetric(vertical: AppSpacing.md),
      height: AppSizes.dividerHeight,
      color: colors.outline,
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    final colors = context.colors;
    
    if (validationErrors.isNotEmpty) {
      return colors.error.withValues(alpha: AppOpacities.error);
    }
    
    return colors.surface.withValues(alpha: AppOpacities.highlight);
  }
}

/// Convenience widget for form fields with labels
class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.child,
    this.label,
    this.isRequired = false,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });

  final Widget child;
  final String? label;
  final bool isRequired;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    final hasError = errorText != null && errorText!.isNotEmpty;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        if (label != null) ...[
          Row(
            children: [
              if (prefixIcon != null) ...[
                Icon(
                  prefixIcon,
                  size: AppSizes.iconSizeSm,
                  color: hasError ? colors.error : colors.secondaryText,
                ),
                AppSpacing.xsHorizontalGap,
              ],
              Text(
                label!,
                style: textStyle.label.copyWith(
                  color: hasError ? colors.error : colors.primaryText,
                ),
              ),
              if (isRequired) ...[
                AppSpacing.xsHorizontalGap,
                Text(
                  '*',
                  style: textStyle.label.copyWith(
                    color: colors.error,
                  ),
                ),
              ],
              if (suffixIcon != null) ...[
                const Spacer(),
                Icon(
                  suffixIcon,
                  size: AppSizes.iconSizeSm,
                  color: colors.secondaryText,
                ),
              ],
            ],
          ),
          AppSpacing.xsVerticalGap,
        ],
        
        // Field
        if (onTap != null)
          GestureDetector(
            onTap: onTap,
            child: child,
          )
        else
          child,
        
        // Helper text or error
        if (helperText != null && !hasError) ...[
          AppSpacing.xsVerticalGap,
          Text(
            helperText!,
            style: textStyle.caption.copyWith(
              color: colors.secondaryText,
            ),
          ),
        ],
        
        if (hasError) ...[
          AppSpacing.xsVerticalGap,
          Row(
            children: [
              Icon(
                AppIcons.error,
                size: AppSizes.iconSizeSm,
                color: colors.error,
              ),
              AppSpacing.xsHorizontalGap,
              Expanded(
                child: Text(
                  errorText!,
                  style: textStyle.caption.copyWith(
                    color: colors.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

 