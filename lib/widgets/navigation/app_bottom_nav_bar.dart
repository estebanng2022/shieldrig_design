import 'package:flutter/material.dart';
import '../../theme/extensions/context_extensions.dart';
import '../../theme/app_spacing.dart';

import '../../theme/app_sizes.dart';
import '../../theme/app_opacities.dart';

/// Premium bottom navigation bar widget with animated indicator
/// 
/// Provides a consistent bottom navigation with customizable items,
/// animated active indicator, and theme integration.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onItemSelected,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.showLabels = true,
    this.elevation = 8.0,
    this.height = 80.0,
    this.indicatorHeight = 3.0,
    this.indicatorWidth = 24.0,
  });

  /// Navigation items
  final List<AppBottomNavItem> items;

  /// Currently selected index
  final int currentIndex;

  /// Callback when item is selected
  final ValueChanged<int>? onItemSelected;

  /// Background color (uses theme surface by default)
  final Color? backgroundColor;

  /// Color for active item
  final Color? activeColor;

  /// Color for inactive items
  final Color? inactiveColor;

  /// Whether to show labels below icons
  final bool showLabels;

  /// Elevation of the navigation bar
  final double elevation;

  /// Height of the navigation bar
  final double height;

  /// Height of the active indicator
  final double indicatorHeight;

  /// Width of the active indicator
  final double indicatorWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    // Get colors from theme or use provided ones
    final effectiveBackgroundColor = backgroundColor ?? colors.surface;
    final effectiveActiveColor = activeColor ?? colors.primary;
    final effectiveInactiveColor = inactiveColor ?? colors.textSecondary;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: colors.overlay.withValues(alpha: AppOpacities.shadow),
            blurRadius: elevation,
            offset: Offset(0, -AppSizes.shadowOffset),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isActive = index == currentIndex;

            return Expanded(
              child: _buildNavItem(
                context,
                item,
                index,
                isActive,
                effectiveActiveColor,
                effectiveInactiveColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    AppBottomNavItem item,
    int index,
    bool isActive,
    Color activeColor,
    Color inactiveColor,
  ) {
    final textStyle = context.textStyle;

    return GestureDetector(
      onTap: () => onItemSelected?.call(index),
              child: SizedBox(
          height: height,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Active indicator
            if (isActive) ...[
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: indicatorWidth,
                height: indicatorHeight,
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(indicatorHeight / 2),
                ),
              ),
              AppSpacing.xsVerticalGap,
            ] else ...[
              SizedBox(height: indicatorHeight + AppSpacing.xs),
            ],
            
            // Icon
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Icon(
                isActive ? (item.activeIcon ?? item.icon) : item.icon,
                size: AppSizes.iconSizeMd,
                color: isActive ? activeColor : inactiveColor,
              ),
            ),
            
            // Label
            if (showLabels && item.label.isNotEmpty) ...[
              AppSpacing.xsVerticalGap,
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Text(
                  item.label,
                  style: textStyle.caption.copyWith(
                    color: isActive ? activeColor : inactiveColor,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Bottom navigation item model
class AppBottomNavItem {
  const AppBottomNavItem({
    required this.icon,
    this.activeIcon,
    this.label = '',
    this.onTap,
  });

  /// Icon for inactive state
  final IconData icon;

  /// Icon for active state (optional, uses icon if not provided)
  final IconData? activeIcon;

  /// Label text (optional)
  final String label;

  /// Tap callback (optional, can be handled by parent)
  final VoidCallback? onTap;
}

/// Convenience widget for common bottom navigation patterns
class AppBottomNavBarHelper {
  /// Create a bottom navigation bar with common patterns
  static AppBottomNavBar create({
    required List<AppBottomNavItem> items,
    required int currentIndex,
    ValueChanged<int>? onItemSelected,
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
    bool showLabels = true,
    double elevation = 8.0,
    double height = 80.0,
  }) {
    return AppBottomNavBar(
      items: items,
      currentIndex: currentIndex,
      onItemSelected: onItemSelected,
      backgroundColor: backgroundColor,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      showLabels: showLabels,
      elevation: elevation,
      height: height,
    );
  }

  /// Create navigation items from a simple list
  static List<AppBottomNavItem> createItems({
    required List<IconData> icons,
    List<String> labels = const [],
    List<IconData> activeIcons = const [],
  }) {
    return List.generate(icons.length, (index) {
      return AppBottomNavItem(
        icon: icons[index],
        activeIcon: index < activeIcons.length ? activeIcons[index] : null,
        label: index < labels.length ? labels[index] : '',
      );
    });
  }
} 