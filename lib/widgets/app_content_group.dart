import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_sizes.dart';
import '../theme/app_opacities.dart';
import '../theme/app_radius.dart';
import '../theme/extensions/context_extensions.dart';
import '../theme/app_spacing.dart';

/// Premium content group widget for organizing visual blocks
class AppContentGroup extends StatelessWidget {
  const AppContentGroup({
    super.key,
    required this.children,
    this.title,
    this.subtitle,
    this.variant = AppContentGroupVariant.stacked,
    this.spacing,
    this.padding,
    this.margin,
    this.crossAxisCount = 2,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.maxCrossAxisExtent,
    this.childAspectRatio,
    this.showDivider = false,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.onItemTap,
  });

  final List<Widget> children;
  final String? title;
  final String? subtitle;
  final AppContentGroupVariant variant;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final int crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? maxCrossAxisExtent;
  final double? childAspectRatio;
  final bool showDivider;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final Function(int)? onItemTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    // Get group spacing
    final _ = spacing ?? _getDefaultSpacing(context);
    
    // Get group padding
    final groupPadding = padding ?? EdgeInsets.zero;
    
    // Get group margin
    final groupMargin = margin ?? EdgeInsets.zero;
    
    // Get background color
    final groupBackgroundColor = backgroundColor ?? _getBackgroundColor(context);
    
    // Get border radius
    final groupBorderRadius = borderRadius ?? _getBorderRadius(context);
    
    Widget groupContent = Container(
      padding: groupPadding,
      decoration: BoxDecoration(
        color: groupBackgroundColor,
        borderRadius: groupBorderRadius,
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
          
          // Content based on variant
          _buildContent(context, 16.0),
        ],
      ),
    );
    
    // Add divider if requested
    if (showDivider) {
      groupContent = Column(
        children: [
          groupContent,
          _buildDivider(context),
        ],
      );
    }
    
    // Wrap with margin container if needed
    if (groupMargin != EdgeInsets.zero) {
      groupContent = Container(
        margin: groupMargin,
        child: groupContent,
      );
    }
    
    return groupContent;
  }

  Widget _buildHeader(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: textStyle.heading5.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (subtitle != null) ...[
          AppSpacing.xsVerticalGap,
          Text(
            subtitle!,
            style: textStyle.body2.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildContent(BuildContext context, double groupSpacing) {
    switch (variant) {
      case AppContentGroupVariant.stacked:
        return _buildStackedLayout(context, groupSpacing);
      case AppContentGroupVariant.grid:
        return _buildGridLayout(context);
      case AppContentGroupVariant.flow:
        return _buildFlowLayout(context, groupSpacing);
      case AppContentGroupVariant.list:
        return _buildListLayout(context, groupSpacing);
    }
  }

  Widget _buildStackedLayout(BuildContext context, double spacing) {
    return Column(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;
        
        return Column(
          children: [
            if (onItemTap != null)
              GestureDetector(
                onTap: () => onItemTap!(index),
                child: child,
              )
            else
              child,
            if (index < children.length - 1) ...[
              SizedBox(height: spacing),
              if (index < children.length - 2) _buildItemDivider(context),
            ],
          ],
        );
      }).toList(),
    );
  }

  Widget _buildGridLayout(BuildContext context) {
    final mainSpacing = mainAxisSpacing ?? AppSpacing.sm;
    final crossSpacing = crossAxisSpacing ?? AppSpacing.sm;
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainSpacing.toDouble(),
        crossAxisSpacing: crossSpacing.toDouble(),
        childAspectRatio: childAspectRatio ?? 1.0,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        final child = children[index];
        
        if (onItemTap != null) {
          return GestureDetector(
            onTap: () => onItemTap!(index),
            child: child,
          );
        }
        
        return child;
      },
    );
  }

  Widget _buildFlowLayout(BuildContext context, double spacing) {
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;
        
        if (onItemTap != null) {
          return GestureDetector(
            onTap: () => onItemTap!(index),
            child: child,
          );
        }
        
        return child;
      }).toList(),
    );
  }

  Widget _buildListLayout(BuildContext context, double spacing) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length,
      separatorBuilder: (context, index) => SizedBox(height: spacing),
      itemBuilder: (context, index) {
        final child = children[index];
        
        if (onItemTap != null) {
          return GestureDetector(
            onTap: () => onItemTap!(index),
            child: child,
          );
        }
        
        return child;
      },
    );
  }

  Widget _buildItemDivider(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.xs),
      height: AppSizes.dividerHeight,
      color: colors.divider,
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

  double _getDefaultSpacing(BuildContext context) {
    
    switch (variant) {
      case AppContentGroupVariant.stacked:
        return AppSpacing.md;
      case AppContentGroupVariant.grid:
        return AppSpacing.sm;
      case AppContentGroupVariant.flow:
        return AppSpacing.sm;
      case AppContentGroupVariant.list:
        return AppSpacing.sm;
    }
  }

  BorderRadius _getBorderRadius(BuildContext context) {
    
    switch (variant) {
      case AppContentGroupVariant.stacked:
        return AppRadius.defaultRadius.mdRadius;
      case AppContentGroupVariant.grid:
        return AppRadius.defaultRadius.smRadius;
      case AppContentGroupVariant.flow:
        return AppRadius.defaultRadius.smRadius;
      case AppContentGroupVariant.list:
        return AppRadius.defaultRadius.smRadius;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    final colors = context.colors;
    
    switch (variant) {
      case AppContentGroupVariant.stacked:
        return colors.surface;
      case AppContentGroupVariant.grid:
        return colors.surface.withValues(alpha: AppOpacities.highlight);
      case AppContentGroupVariant.flow:
        return Colors.transparent;
      case AppContentGroupVariant.list:
        return colors.surface;
    }
  }
}

/// Content group variant enum
enum AppContentGroupVariant {
  stacked,
  grid,
  flow,
  list,
}

/// Convenience widget for stacked content
class AppStackedGroup extends StatelessWidget {
  const AppStackedGroup({
    super.key,
    required this.children,
    this.title,
    this.subtitle,
    this.spacing,
    this.padding,
    this.margin,
    this.showDivider = false,
    this.onItemTap,
  });

  final List<Widget> children;
  final String? title;
  final String? subtitle;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showDivider;
  final Function(int)? onItemTap;

  @override
  Widget build(BuildContext context) {
    return AppContentGroup(
      title: title,
      subtitle: subtitle,
      variant: AppContentGroupVariant.stacked,
      spacing: spacing,
      padding: padding,
      margin: margin,
      showDivider: showDivider,
      onItemTap: onItemTap,
      children: children,
    );
  }
}

/// Convenience widget for grid content
class AppGridGroup extends StatelessWidget {
  const AppGridGroup({
    super.key,
    required this.children,
    this.title,
    this.subtitle,
    this.crossAxisCount = 2,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio,
    this.padding,
    this.margin,
    this.onItemTap,
  });

  final List<Widget> children;
  final String? title;
  final String? subtitle;
  final int crossAxisCount;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final double? childAspectRatio;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function(int)? onItemTap;

  @override
  Widget build(BuildContext context) {
    return AppContentGroup(
      title: title,
      subtitle: subtitle,
      variant: AppContentGroupVariant.grid,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
      padding: padding,
      margin: margin,
      onItemTap: onItemTap,
      children: children,
    );
  }
} 