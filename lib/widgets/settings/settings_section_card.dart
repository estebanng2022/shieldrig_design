import 'package:flutter/material.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

/// Premium settings section card widget with complete theme integration
/// Provides a consistent container for settings sections with proper spacing and styling
class SettingsSectionCard extends StatelessWidget {
  const SettingsSectionCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.children,
    this.spacing = AppSpacing.md,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.backgroundColor,
  });

  /// Title of the settings section
  final String title;
  
  /// Optional subtitle for the section
  final String? subtitle;
  
  /// List of widgets to display in the section
  final List<Widget> children;
  
  /// Spacing between children (default: md)
  final double spacing;
  
  /// Padding around the content (default: theme padding)
  final EdgeInsetsGeometry? padding;
  
  /// Margin around the card (default: none)
  final EdgeInsetsGeometry? margin;
  
  /// Elevation of the card (default: theme elevation)
  final double? elevation;
  
  /// Border radius of the card (default: theme radius)
  final BorderRadius? borderRadius;
  
  /// Background color (default: theme surface)
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return AppCard(
      padding: padding ?? AppSpacing.mdPadding,
      margin: margin,
      elevation: elevation,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: context.textStyle.heading5.copyWith(
              color: colors.primaryText,
            ),
          ),
          
          // Subtitle (if provided)
          if (subtitle != null) ...[
            SizedBox(height: AppSpacing.xs),
            Text(
              subtitle!,
              style: context.textStyle.body2.copyWith(
                color: colors.secondaryText,
              ),
            ),
          ],
          
          // Spacing between title and content
          SizedBox(height: AppSpacing.md),
          
          // Children with spacing
          ...children.expand((child) => [
            child,
            if (child != children.last) SizedBox(height: spacing),
          ]),
        ],
      ),
    );
  }
} 