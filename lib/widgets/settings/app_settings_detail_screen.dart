import 'package:flutter/material.dart';
import '../../theme/app_spacing.dart';
import '../../theme/extensions/context_extensions.dart';

/// Premium settings detail screen widget
/// 
/// Reusable screen for settings detail pages like "Edit Profile", 
/// "Notifications", etc. Provides consistent layout with AppBar,
/// scroll functionality, and design system integration.
class AppSettingsDetailScreen extends StatelessWidget {
  const AppSettingsDetailScreen({
    super.key,
    required this.title,
    required this.child,
    this.onBackPressed,
    this.padding,
    this.backgroundColor,
    this.scrollable = true,
  });

  /// Screen title displayed in AppBar
  final String title;

  /// Main content widget
  final Widget child;

  /// Custom back button action (optional)
  final VoidCallback? onBackPressed;

  /// Custom padding for content (defaults to AppSpacing.mdPadding)
  final EdgeInsets? padding;

  /// Background color (optional)
  final Color? backgroundColor;

  /// Whether content should be scrollable (defaults to true)
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? AppSpacing.mdPadding;
    final colors = context.colors;

    return Scaffold(
      backgroundColor: backgroundColor ?? colors.background,
      appBar: AppBar(
        title: Text(
          title,
          style: context.textStyle.heading4.copyWith(
            fontWeight: FontWeight.w600,
            color: colors.primaryText,
          ),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: colors.primaryText,
            size: 20,
          ),
          onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: scrollable
          ? SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: effectivePadding,
                child: child,
              ),
            )
          : Container(
              width: double.infinity,
              padding: effectivePadding,
              child: child,
            ),
    );
  }
} 