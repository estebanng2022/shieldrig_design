import 'package:flutter/material.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

/// Premium settings list tile widget with complete theme integration
/// Provides a consistent list item for settings with proper styling and interactions
class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.isEnabled = true,
    this.showDivider = true,
    this.padding,
    this.iconColor,
    this.textColor,
    this.subtitleColor,
    this.backgroundColor,
  });

  /// Title of the settings item
  final String title;
  
  /// Optional subtitle for the item
  final String? subtitle;
  
  /// Leading widget (usually an icon)
  final Widget? leading;
  
  /// Trailing widget (usually a chevron or switch)
  final Widget? trailing;
  
  /// Callback when the tile is tapped
  final VoidCallback? onTap;
  
  /// Whether the tile is enabled (default: true)
  final bool isEnabled;
  
  /// Whether to show a divider below the tile (default: true)
  final bool showDivider;
  
  /// Custom padding for the tile
  final EdgeInsetsGeometry? padding;
  
  /// Custom icon color
  final Color? iconColor;
  
  /// Custom text color
  final Color? textColor;
  
  /// Custom subtitle color
  final Color? subtitleColor;
  
  /// Custom background color
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Column(
      children: [
        // List Tile
        ListTile(
          onTap: isEnabled ? onTap : null,
          enabled: isEnabled,
          contentPadding: padding ?? EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          leading: leading != null ? IconTheme(
            data: IconThemeData(
              color: iconColor ?? colors.primaryText,
              size: AppSizes.iconSizeMd,
            ),
            child: leading!,
          ) : null,
          title: Text(
            title,
            style: context.textStyle.body1.copyWith(
              color: textColor ?? colors.primaryText,
            ),
          ),
          subtitle: subtitle != null ? Text(
            subtitle!,
            style: context.textStyle.body2.copyWith(
              color: subtitleColor ?? colors.secondaryText,
            ),
          ) : null,
          trailing: trailing,
        ),
        
        // Divider
        if (showDivider) ...[
          Divider(
            height: 1,
            thickness: 1,
            color: colors.outline,
            indent: AppSpacing.lg,
            endIndent: AppSpacing.lg,
          ),
        ],
      ],
    );
  }
} 