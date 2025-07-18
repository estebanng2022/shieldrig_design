import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_icons.dart';
// import '../theme/extensions/context_extensions.dart';

// Import widgets
import 'app_screen_base.dart';
import 'app_header_section.dart';

/// Premium bottom sheet widget with complete theme integration
/// Provides a consistent bottom sheet with header and content area
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.description,
    this.trailingActions = const [],
    this.primaryAction,
    this.secondaryAction,
    this.showCloseButton = true,
    this.onClose,
    this.padding,
    this.maxWidth,
    this.backgroundColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.shape,
    this.clipBehavior = Clip.hardEdge,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final String? description;
  final List<Widget> trailingActions;
  final Widget? primaryAction;
  final Widget? secondaryAction;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final EdgeInsetsGeometry? padding;
  final double? maxWidth;
  final Color? backgroundColor;
  final bool isDismissible;
  final bool enableDrag;
  final ShapeBorder? shape;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    
    // Build header if title is provided
    Widget? header;
    if (title != null) {
      header = AppHeaderSection(
        title: title,
        subtitle: subtitle,
        description: description,
        variant: AppHeaderVariant.compact,
        trailingActions: trailingActions,
        primaryAction: primaryAction,
        secondaryAction: secondaryAction,
        showBackButton: false,
        useStackLayout: false, // Use row layout for bottom sheet
        leadingIcon: showCloseButton ? AppIcons.close : null,
        leadingAction: showCloseButton ? (onClose ?? () => Navigator.of(context).pop()) : null,
        isCompact: false, // Allow description and actions to show
      );
    }

    // Build content using AppScreenBase
    Widget content = AppScreenBase(
      scrollable: true,
      safeArea: true,
      padding: padding,
      maxWidth: maxWidth,
      backgroundColor: backgroundColor,
      child: child,
    );

    // Wrap with header if provided
    if (header != null) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          header,
          Expanded(child: content),
        ],
      );
    }

    return content;
  }
}

/// Convenience method to show AppBottomSheet
class AppBottomSheetHelper {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    String? description,
    List<Widget> trailingActions = const [],
    Widget? primaryAction,
    Widget? secondaryAction,
    bool showCloseButton = true,
    VoidCallback? onClose,
    EdgeInsetsGeometry? padding,
    double? maxWidth,
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      shape: shape,
      clipBehavior: clipBehavior,
      builder: (context) => AppBottomSheet(
        title: title,
        subtitle: subtitle,
        description: description,
        trailingActions: trailingActions,
        primaryAction: primaryAction,
        secondaryAction: secondaryAction,
        showCloseButton: showCloseButton,
        onClose: onClose,
        padding: padding,
        maxWidth: maxWidth,
        backgroundColor: backgroundColor,
        child: child,
      ),
    );
  }
} 