import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_spacing.dart';

/// Premium screen base widget with complete theme integration
/// Provides a consistent foundation for all screens with proper spacing, scrolling, and responsive behavior
class AppScreenBase extends StatelessWidget {
  const AppScreenBase({
    super.key,
    required this.child,
    this.scrollable = false,
    this.backgroundColor,
    this.safeArea = true,
    this.padding,
    this.maxWidth,
  });

  final Widget child;
  final bool scrollable;
  final Color? backgroundColor;
  final bool safeArea;
  final EdgeInsetsGeometry? padding;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    Widget content = child;

    // Apply scrolling if enabled
    if (scrollable) {
      content = SingleChildScrollView(
        child: content,
      );
    }

    // Apply safe area if enabled
    if (safeArea) {
      content = SafeArea(
        child: content,
      );
    }

    // Apply default padding using theme spacing (24px = lg)
    final effectivePadding = padding ?? EdgeInsets.all(AppSpacing.lg);
    content = Padding(
      padding: effectivePadding,
      child: content,
    );

    // Apply max width constraint if specified
    if (maxWidth != null) {
      content = Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth!),
          child: content,
        ),
      );
    }

    return Material(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: content,
    );
  }
} 