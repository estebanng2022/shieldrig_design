import 'package:flutter/material.dart';
import 'app_button.dart';
import '../theme/app_sizes.dart';
import '../theme/extensions/context_extensions.dart';

/// Premium action section widget for grouping action buttons
/// 
/// Provides a consistent layout for action buttons with proper spacing,
/// responsive design, and theme integration.
class AppActionSection extends StatelessWidget {
  const AppActionSection({
    super.key,
    required this.actions,
    this.layout = AppActionLayout.horizontal,
    this.alignment = AppActionAlignment.end,
    this.spacing,
    this.padding,
    this.elevation,
    this.background,
    this.border,
    this.radius,
    this.divider = false,
    this.compact = false,
  });

  /// Action buttons to display
  final List<AppActionButton> actions;

  /// Layout direction for actions
  final AppActionLayout layout;

  /// Alignment of actions within the section
  final AppActionAlignment alignment;

  /// Spacing between actions (uses theme default if null)
  final double? spacing;

  /// Padding around the section (uses theme default if null)
  final EdgeInsetsGeometry? padding;

  /// Elevation level (uses theme default if null)
  final double? elevation;

  /// Background color (uses theme default if null)
  final Color? background;

  /// Border configuration
  final AppActionBorder? border;

  /// Border radius (uses theme default if null)
  final BorderRadius? radius;

  /// Whether to show a divider above the section
  final bool divider;

  /// Whether to use compact spacing
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    
    // Determine spacing based on layout and device
    final actionSpacing = spacing ?? 
      (layout == AppActionLayout.horizontal 
        ? (compact ? 8.0 : 16.0)
        : (compact ? 4.0 : 8.0));
    
    // Determine padding based on layout and device
    final sectionPadding = padding ?? 
      (layout == AppActionLayout.horizontal
        ? EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: compact ? 16.0 : 24.0,
          )
        : EdgeInsets.all(compact ? 16.0 : 24.0));

    // Build action buttons
    final actionWidgets = actions.map((action) {
      return _buildActionButton(context, action);
    }).toList();

    // Build layout
    Widget layoutWidget;
    switch (layout) {
      case AppActionLayout.horizontal:
        layoutWidget = _buildHorizontalLayout(actionWidgets, actionSpacing, alignment);
        break;
      case AppActionLayout.vertical:
        layoutWidget = _buildVerticalLayout(actionWidgets, actionSpacing, alignment);
        break;
      case AppActionLayout.stacked:
        layoutWidget = _buildStackedLayout(actionWidgets, actionSpacing, alignment);
        break;
    }

    // Build container with styling
    Widget container = Container(
      padding: sectionPadding,
      decoration: BoxDecoration(
        color: background ?? colors.surface,
        borderRadius: radius ?? BorderRadius.circular(8.0),
        border: border?.build(context),
        boxShadow: elevation != null 
          ? [BoxShadow(
              color: context.colors.black.withValues(alpha: 0.1),
              blurRadius: elevation!,
              offset: Offset(0, elevation! * 0.5),
            )]
          : null,
      ),
      child: layoutWidget,
    );

    // Add divider if requested
    if (divider) {
      container = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: colors.outline,
            height: AppSizes.dividerThickness,
            thickness: AppSizes.dividerThickness,
          ),
          container,
        ],
      );
    }

    return container;
  }

  Widget _buildActionButton(BuildContext context, AppActionButton action) {
    return AppButton(
      onPressed: action.onPressed,
      label: action.label,
      variant: action.variant,
      size: action.size,
      isLoading: action.loading,
      isDisabled: action.disabled,
      icon: action.leading,
    );
  }

  Widget _buildHorizontalLayout(
    List<Widget> actions, 
    double spacing, 
    AppActionAlignment alignment
  ) {
    final mainAxisAlignment = _getMainAxisAlignment(alignment);
    
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: actions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;
        
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            action,
            if (index < actions.length - 1) 
              SizedBox(width: spacing),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildVerticalLayout(
    List<Widget> actions, 
    double spacing, 
    AppActionAlignment alignment
  ) {
    final crossAxisAlignment = _getCrossAxisAlignment(alignment);
    
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: actions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;
        
        return Column(
          children: [
            action,
            if (index < actions.length - 1) 
              SizedBox(height: spacing),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildStackedLayout(
    List<Widget> actions, 
    double spacing, 
    AppActionAlignment alignment
  ) {
    final crossAxisAlignment = _getCrossAxisAlignment(alignment);
    
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: actions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;
        
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              action,
              if (index < actions.length - 1) 
                SizedBox(height: spacing),
            ],
          ),
        );
      }).toList(),
    );
  }

  MainAxisAlignment _getMainAxisAlignment(AppActionAlignment alignment) {
    switch (alignment) {
      case AppActionAlignment.start:
        return MainAxisAlignment.start;
      case AppActionAlignment.center:
        return MainAxisAlignment.center;
      case AppActionAlignment.end:
        return MainAxisAlignment.end;
      case AppActionAlignment.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case AppActionAlignment.spaceAround:
        return MainAxisAlignment.spaceAround;
      case AppActionAlignment.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
    }
  }

  CrossAxisAlignment _getCrossAxisAlignment(AppActionAlignment alignment) {
    switch (alignment) {
      case AppActionAlignment.start:
        return CrossAxisAlignment.start;
      case AppActionAlignment.center:
        return CrossAxisAlignment.center;
      case AppActionAlignment.end:
        return CrossAxisAlignment.end;
      case AppActionAlignment.spaceBetween:
      case AppActionAlignment.spaceAround:
      case AppActionAlignment.spaceEvenly:
        return CrossAxisAlignment.stretch;
    }
  }
}

/// Layout options for action sections
enum AppActionLayout {
  /// Actions arranged horizontally (default)
  horizontal,
  
  /// Actions arranged vertically
  vertical,
  
  /// Actions stacked with full width
  stacked,
}

/// Alignment options for action sections
enum AppActionAlignment {
  /// Align to start
  start,
  
  /// Align to center
  center,
  
  /// Align to end (default)
  end,
  
  /// Space between actions
  spaceBetween,
  
  /// Space around actions
  spaceAround,
  
  /// Space evenly between actions
  spaceEvenly,
}

/// Border configuration for action sections
class AppActionBorder {
  const AppActionBorder({
    this.color,
    this.width = 1.0,
    this.style = BorderStyle.solid,
  });

  final Color? color;
  final double width;
  final BorderStyle style;

  Border? build(BuildContext context) {
    final theme = Theme.of(context);
    return Border.all(
      color: color ?? theme.colorScheme.outline,
      width: width,
      style: style,
    );
  }
}

/// Action button configuration
class AppActionButton {
  const AppActionButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.loading = false,
    this.disabled = false,
    this.leading,
    this.trailing,
    this.textStyle,
  });

  /// Button label text
  final String label;

  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Button variant
  final AppButtonVariant variant;

  /// Button size
  final AppButtonSize size;

  /// Whether button is in loading state
  final bool loading;

  /// Whether button is disabled
  final bool disabled;

  /// Leading icon
  final IconData? leading;

  /// Trailing icon
  final IconData? trailing;

  /// Custom text style
  final TextStyle? textStyle;
}

// Convenience widgets for common action patterns

/// Standard form actions (Submit/Cancel)
class AppFormActions extends StatelessWidget {
  const AppFormActions({
    super.key,
    required this.onSubmit,
    this.onCancel,
    this.submitLabel = 'Submit',
    this.cancelLabel = 'Cancel',
    this.submitLoading = false,
    this.cancelLoading = false,
    this.submitDisabled = false,
    this.cancelDisabled = false,
    this.layout = AppActionLayout.horizontal,
    this.alignment = AppActionAlignment.end,
    this.spacing,
    this.padding,
    this.elevation,
    this.background,
    this.border,
    this.radius,
    this.divider = true,
    this.compact = false,
  });

  final VoidCallback onSubmit;
  final VoidCallback? onCancel;
  final String submitLabel;
  final String cancelLabel;
  final bool submitLoading;
  final bool cancelLoading;
  final bool submitDisabled;
  final bool cancelDisabled;
  final AppActionLayout layout;
  final AppActionAlignment alignment;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? background;
  final AppActionBorder? border;
  final BorderRadius? radius;
  final bool divider;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final actions = <AppActionButton>[];

    // Add cancel button if provided
    if (onCancel != null) {
      actions.add(AppActionButton(
        label: cancelLabel,
        onPressed: onCancel!,
        variant: AppButtonVariant.secondary,
        loading: cancelLoading,
        disabled: cancelDisabled,
      ));
    }

    // Add submit button
    actions.add(AppActionButton(
      label: submitLabel,
      onPressed: onSubmit,
      variant: AppButtonVariant.primary,
      loading: submitLoading,
      disabled: submitDisabled,
    ));

    return AppActionSection(
      actions: actions,
      layout: layout,
      alignment: alignment,
      spacing: spacing,
      padding: padding,
      elevation: elevation,
      background: background,
      border: border,
      radius: radius,
      divider: divider,
      compact: compact,
    );
  }
}

/// Confirmation actions (Confirm/Cancel)
class AppConfirmActions extends StatelessWidget {
  const AppConfirmActions({
    super.key,
    required this.onConfirm,
    this.onCancel,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.confirmLoading = false,
    this.cancelLoading = false,
    this.confirmDisabled = false,
    this.cancelDisabled = false,
    this.confirmVariant = AppButtonVariant.primary,
    this.layout = AppActionLayout.horizontal,
    this.alignment = AppActionAlignment.end,
    this.spacing,
    this.padding,
    this.elevation,
    this.background,
    this.border,
    this.radius,
    this.divider = true,
    this.compact = false,
  });

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String confirmLabel;
  final String cancelLabel;
  final bool confirmLoading;
  final bool cancelLoading;
  final bool confirmDisabled;
  final bool cancelDisabled;
  final AppButtonVariant confirmVariant;
  final AppActionLayout layout;
  final AppActionAlignment alignment;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? background;
  final AppActionBorder? border;
  final BorderRadius? radius;
  final bool divider;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final actions = <AppActionButton>[];

    // Add cancel button if provided
    if (onCancel != null) {
      actions.add(AppActionButton(
        label: cancelLabel,
        onPressed: onCancel!,
        variant: AppButtonVariant.secondary,
        loading: cancelLoading,
        disabled: cancelDisabled,
      ));
    }

    // Add confirm button
    actions.add(AppActionButton(
      label: confirmLabel,
      onPressed: onConfirm,
      variant: confirmVariant,
      loading: confirmLoading,
      disabled: confirmDisabled,
    ));

    return AppActionSection(
      actions: actions,
      layout: layout,
      alignment: alignment,
      spacing: spacing,
      padding: padding,
      elevation: elevation,
      background: background,
      border: border,
      radius: radius,
      divider: divider,
      compact: compact,
    );
  }
}

/// Danger actions (Delete/Cancel)
class AppDangerActions extends StatelessWidget {
  const AppDangerActions({
    super.key,
    required this.onDelete,
    this.onCancel,
    this.deleteLabel = 'Delete',
    this.cancelLabel = 'Cancel',
    this.deleteLoading = false,
    this.cancelLoading = false,
    this.deleteDisabled = false,
    this.cancelDisabled = false,
    this.layout = AppActionLayout.horizontal,
    this.alignment = AppActionAlignment.end,
    this.spacing,
    this.padding,
    this.elevation,
    this.background,
    this.border,
    this.radius,
    this.divider = true,
    this.compact = false,
  });

  final VoidCallback onDelete;
  final VoidCallback? onCancel;
  final String deleteLabel;
  final String cancelLabel;
  final bool deleteLoading;
  final bool cancelLoading;
  final bool deleteDisabled;
  final bool cancelDisabled;
  final AppActionLayout layout;
  final AppActionAlignment alignment;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? background;
  final AppActionBorder? border;
  final BorderRadius? radius;
  final bool divider;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final actions = <AppActionButton>[];

    // Add cancel button if provided
    if (onCancel != null) {
      actions.add(AppActionButton(
        label: cancelLabel,
        onPressed: onCancel!,
        variant: AppButtonVariant.secondary,
        loading: cancelLoading,
        disabled: cancelDisabled,
      ));
    }

    // Add delete button
    actions.add(AppActionButton(
      label: deleteLabel,
      onPressed: onDelete,
      variant: AppButtonVariant.danger,
      loading: deleteLoading,
      disabled: deleteDisabled,
    ));

    return AppActionSection(
      actions: actions,
      layout: layout,
      alignment: alignment,
      spacing: spacing,
      padding: padding,
      elevation: elevation,
      background: background,
      border: border,
      radius: radius,
      divider: divider,
      compact: compact,
    );
  }
} 