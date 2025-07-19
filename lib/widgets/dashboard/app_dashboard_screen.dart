import 'package:flutter/material.dart';
import '../app_header_section.dart';
import '../navigation/app_bottom_nav_bar.dart';
import '../../theme/app_spacing.dart';
import 'models/app_dashboard_tab.dart';
import 'models/app_dashboard_controller.dart';

/// Premium dashboard screen widget with modular tabs and navigation
/// 
/// Provides a consistent dashboard layout with optional header per tab,
/// bottom navigation, and flexible content areas. Composed entirely
/// of existing design system widgets for maximum reusability.
class AppDashboardScreen extends StatelessWidget {
  const AppDashboardScreen({
    super.key,
    required this.tabs,
    required this.currentTabIndex,
    this.onTabChanged,
    this.controller,
    this.showBottomNav = true,
    this.bottomNavItems,
    this.scrollable = true,
    this.safeArea = true,
    this.padding,
    this.maxWidth,
    this.backgroundColor,
  });

  /// Dashboard tabs with content and configuration
  final List<AppDashboardTab> tabs;

  /// Currently active tab index
  final int currentTabIndex;

  /// Callback when tab changes
  final ValueChanged<int>? onTabChanged;

  /// Controller for programmatic navigation
  final AppDashboardController? controller;

  /// Whether to show bottom navigation
  final bool showBottomNav;

  /// Bottom navigation items (optional)
  final List<AppBottomNavItem>? bottomNavItems;

  /// Whether the content is scrollable
  final bool scrollable;

  /// Whether to apply safe area
  final bool safeArea;

  /// Custom padding for the screen
  final EdgeInsets? padding;

  /// Maximum width constraint
  final double? maxWidth;

  /// Background color
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final currentTab = tabs[currentTabIndex];
    
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header section (if enabled for current tab)
            if (currentTab.showHeader) ...[
              _buildHeaderSection(context, currentTab),
              AppSpacing.lgVerticalGap,
            ],
            
            // Main content area
            Expanded(
              child: currentTab.child,
            ),
            
            // Bottom navigation (if enabled)
            if (showBottomNav && bottomNavItems != null) ...[
              AppSpacing.lgVerticalGap,
              AppBottomNavBar(
                items: bottomNavItems!,
                currentIndex: currentTabIndex,
                onItemSelected: (index) {
                  onTabChanged?.call(index);
                  controller?.jumpToTab(index);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context, AppDashboardTab tab) {
    return AppHeaderSection(
      title: tab.title,
      subtitle: tab.subtitle,
      trailingActions: tab.headerActions ?? const [],
      variant: tab.headerVariant ?? AppHeaderVariant.standard,
    );
  }
} 