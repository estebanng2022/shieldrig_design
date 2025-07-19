import 'package:flutter/material.dart';
import '../models/app_dashboard_tab.dart';
import '../tabs/app_settings_tab.dart';
import '../../navigation/app_bottom_nav_bar.dart';

/// Helper for creating the default Settings tab
class AppSettingsTabHelper {
  /// Create the default Settings tab with standard configuration
  static AppDashboardTab createSettingsTab() {
    return const AppDashboardTab(
      key: Key('settings-tab'),
      child: AppSettingsTab(),
      title: 'Settings',
      subtitle: 'Manage your account and preferences',
      showHeader: true,
    );
  }

  /// Create the Settings bottom navigation item
  static AppBottomNavItem createSettingsNavItem() {
    return AppBottomNavItem(
      icon: Icons.manage_accounts,
      activeIcon: Icons.manage_accounts,
      label: 'Settings',
      onTap: () {},
    );
  }
} 