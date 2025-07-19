import 'package:flutter/material.dart';
import '../../app_card.dart';
import '../../app_header_section.dart';
import '../../../theme/extensions/context_extensions.dart';
import '../../../theme/app_spacing.dart';
import '../models/app_dashboard_tab.dart';
import '../models/app_dashboard_controller.dart';
import '../app_dashboard_screen.dart';
import '../../navigation/app_bottom_nav_bar.dart';

/// Convenience widget for common dashboard patterns
class AppDashboardScreenHelper {
  /// Create a dashboard screen with common patterns
  static AppDashboardScreen create({
    required List<AppDashboardTab> tabs,
    required int currentTabIndex,
    ValueChanged<int>? onTabChanged,
    AppDashboardController? controller,
    bool showBottomNav = true,
    List<AppBottomNavItem>? bottomNavItems,
    bool scrollable = true,
    bool safeArea = true,
    EdgeInsets? padding,
    double? maxWidth,
    Color? backgroundColor,
  }) {
    return AppDashboardScreen(
      tabs: tabs,
      currentTabIndex: currentTabIndex,
      onTabChanged: onTabChanged,
      controller: controller,
      showBottomNav: showBottomNav,
      bottomNavItems: bottomNavItems,
      scrollable: scrollable,
      safeArea: safeArea,
      padding: padding,
      maxWidth: maxWidth,
      backgroundColor: backgroundColor,
    );
  }

  /// Create dashboard tabs from simple content
  static List<AppDashboardTab> createTabs({
    required List<Widget> children,
    List<String> titles = const [],
    List<String> subtitles = const [],
    List<List<Widget>> headerActions = const [],
    List<bool> showHeaders = const [],
    List<AppHeaderVariant> headerVariants = const [],
    List<Key> keys = const [],
  }) {
    return List.generate(children.length, (index) {
      return AppDashboardTab(
        key: index < keys.length ? keys[index] : null,
        child: children[index],
        title: index < titles.length ? titles[index] : null,
        subtitle: index < subtitles.length ? subtitles[index] : null,
        headerActions: index < headerActions.length ? headerActions[index] : null,
        showHeader: index < showHeaders.length ? showHeaders[index] : true,
        headerVariant: index < headerVariants.length ? headerVariants[index] : null,
      );
    });
  }

  /// Create a simple dashboard card
  static Widget createDashboardCard({
    required Widget child,
    String? title,
    List<Widget>? actions,
    EdgeInsets? padding,
    Color? backgroundColor,
    double? elevation,
  }) {
    return Builder(
      builder: (context) => AppCard(
        variant: AppCardVariant.elevated,
        elevation: elevation,
        child: Padding(
          padding: padding ?? AppSpacing.mdPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: context.textStyle.heading5.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (actions != null) ...actions,
                  ],
                ),
                AppSpacing.smVerticalGap,
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }

  /// Create a metrics card for dashboard
  static Widget createMetricsCard({
    required String title,
    required String value,
    String? subtitle,
    IconData? icon,
    Color? color,
  }) {
    return Builder(
      builder: (context) => AppCard(
        variant: AppCardVariant.elevated,
        child: Padding(
          padding: AppSpacing.mdPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: 24,
                      color: color,
                    ),
                    AppSpacing.smHorizontalGap,
                  ],
                  Expanded(
                    child: Text(
                      title,
                      style: context.textStyle.caption.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.colors.secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.smVerticalGap,
              Text(
                value,
                style: context.textStyle.heading4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              if (subtitle != null) ...[
                AppSpacing.xsVerticalGap,
                Text(
                  subtitle,
                  style: context.textStyle.caption.copyWith(
                    color: context.colors.secondaryText,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
} 