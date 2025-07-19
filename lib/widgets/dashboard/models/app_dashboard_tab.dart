import 'package:flutter/material.dart';
import '../../app_header_section.dart';

/// Dashboard tab configuration model
class AppDashboardTab {
  const AppDashboardTab({
    this.key,
    required this.child,
    this.showHeader = true,
    this.title,
    this.subtitle,
    this.headerActions,
    this.headerVariant,
  });

  /// Unique key for this tab (useful for testing and animations)
  final Key? key;

  /// Tab content widget
  final Widget child;

  /// Whether to show header for this tab
  final bool showHeader;

  /// Header title (optional)
  final String? title;

  /// Header subtitle (optional)
  final String? subtitle;

  /// Header trailing actions (optional)
  final List<Widget>? headerActions;

  /// Header variant override for this specific tab (optional)
  final AppHeaderVariant? headerVariant;
} 