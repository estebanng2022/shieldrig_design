import 'package:flutter/material.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

/// Premium logo widget with theme integration
/// Displays the app logo with customizable size and color
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size,
    this.color,
    this.showText = true,
  });

  /// Size of the logo icon
  final double? size;
  
  /// Color of the logo (defaults to primary color)
  final Color? color;
  
  /// Whether to show the text label below the icon
  final bool showText;

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? AppSizes.iconSizeXl;
    final effectiveColor = color ?? context.colors.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo Icon
        Icon(
          Icons.security,
          size: effectiveSize,
          color: effectiveColor,
        ),
        
        // Logo Text (optional)
        if (showText) ...[
          SizedBox(height: AppSpacing.xs),
          Text(
            'ShieldRig',
            style: context.textStyle.heading4.copyWith(
              color: effectiveColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
} 