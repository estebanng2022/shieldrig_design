import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_sizes.dart';
import '../theme/app_radius.dart';
import '../theme/app_opacities.dart';
import '../theme/extensions/context_extensions.dart';

/// Action item for AppActionRow widget
class AppActionItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool isDisabled;

  const AppActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.isDisabled = false,
  });
}

/// Premium action row widget with complete theme integration
class AppActionRow extends StatelessWidget {
  final List<AppActionItem> items;
  final MainAxisAlignment alignment;
  final double spacing;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? elevation;
  final bool showDivider;

  const AppActionRow({
    super.key,
    required this.items,
    this.alignment = MainAxisAlignment.spaceEvenly,
    this.spacing = 24.0,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.elevation,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget actionRow = Row(
      mainAxisAlignment: alignment,
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: _ActionIcon(item: item),
        );
      }).toList(),
    );

    // Add padding if specified
    if (padding != null) {
      actionRow = Padding(
        padding: padding!,
        child: actionRow,
      );
    }

    // Add background container if needed
    if (backgroundColor != null || borderRadius != null || elevation != null) {
      actionRow = Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? colors.surface,
          borderRadius: borderRadius ?? AppRadius.defaultRadius.mdRadius,
          boxShadow: elevation != null ? [
            BoxShadow(
              color: colors.overlay.withValues(alpha: AppOpacities.shadow),
              blurRadius: AppSizes.shadowRadius * elevation!,
              offset: Offset(0, AppSizes.shadowOffset),
            ),
          ] : null,
        ),
        child: actionRow,
      );
    }

    // Add divider if requested
    if (showDivider) {
      return Column(
        children: [
          actionRow,
          _buildDivider(context),
        ],
      );
    }

    return actionRow;
  }

  Widget _buildDivider(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.md),
      height: AppSizes.dividerHeight,
      color: colors.divider,
    );
  }
}

/// Individual action icon widget
class _ActionIcon extends StatelessWidget {
  final AppActionItem item;

  const _ActionIcon({required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    final iconColor = item.iconColor ?? 
      (item.isDisabled ? colors.textTertiary : colors.textSecondary);
    final backgroundColor = item.backgroundColor ?? 
      (item.isDisabled ? colors.disabled : colors.surface);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colors.overlay.withValues(alpha: AppOpacities.shadow),
                blurRadius: AppSizes.shadowRadius,
                offset: Offset(0, AppSizes.shadowOffset),
              ),
            ],
          ),
          child: InkWell(
            onTap: item.isDisabled ? null : item.onTap,
            customBorder: const CircleBorder(),
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.sm),
              child: Icon(
                item.icon, 
                size: AppSizes.iconSizeMd,
                color: iconColor,
              ),
            ),
          ),
        ),
        AppSpacing.xsVerticalGap,
        Text(
          item.label,
          style: textStyle.caption.copyWith(
            color: item.isDisabled ? colors.textTertiary : colors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Convenience widget for common action rows
class AppTradeActionRow extends StatelessWidget {
  final VoidCallback? onTrade;
  final VoidCallback? onAddMoney;
  final VoidCallback? onWithdraw;
  final VoidCallback? onMore;
  final bool isDisabled;

  const AppTradeActionRow({
    super.key,
    this.onTrade,
    this.onAddMoney,
    this.onWithdraw,
    this.onMore,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppActionRow(
      items: [
        AppActionItem(
          icon: Icons.trending_up,
          label: 'Trade',
          onTap: onTrade ?? () {},
          isDisabled: isDisabled,
        ),
        AppActionItem(
          icon: Icons.add,
          label: 'Add money',
          onTap: onAddMoney ?? () {},
          isDisabled: isDisabled,
        ),
        AppActionItem(
          icon: Icons.download,
          label: 'Withdraw',
          onTap: onWithdraw ?? () {},
          isDisabled: isDisabled,
        ),
        AppActionItem(
          icon: Icons.more_horiz,
          label: 'More',
          onTap: onMore ?? () {},
          isDisabled: isDisabled,
        ),
      ],
    );
  }
} 