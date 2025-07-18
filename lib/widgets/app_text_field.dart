import 'package:flutter/material.dart';

// Import theme components
import '../theme/app_icons.dart';
import '../theme/app_durations.dart';
import '../theme/app_sizes.dart';
import '../theme/app_opacities.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/extensions/context_extensions.dart';

/// Premium text field widget with complete theme integration
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.variant = AppTextFieldVariant.text,
    this.size = AppTextFieldSize.md,
    this.isRequired = false,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final AppTextFieldVariant variant;
  final AppTextFieldSize size;
  final bool isRequired;
  final bool isDisabled;
  final bool isReadOnly;
  final String? errorText;
  final String? helperText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool autofocus;
  final bool enableSuggestions;
  final bool autocorrect;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isFocused = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final isEnabled = !widget.isDisabled;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        if (widget.label != null) ...[
          Row(
            children: [
              Text(
                widget.label!,
                style: textStyle.label.copyWith(
                  color: hasError ? colors.error : colors.textPrimary,
                ),
              ),
              if (widget.isRequired) ...[
                AppSpacing.xsHorizontalGap,
                Text(
                  '*',
                  style: textStyle.label.copyWith(
                    color: colors.error,
                  ),
                ),
              ],
            ],
          ),
          AppSpacing.xsVerticalGap,
        ],
        
        // Text Field
        AnimatedContainer(
          duration: AppDurations.inputFocus,
          curve: AppDurations.fastCurve,
          decoration: _buildFieldDecoration(context, hasError),
          child: TextFormField(
            controller: widget.controller,
            enabled: isEnabled,
            readOnly: widget.isReadOnly,
            obscureText: _getObscureText(),
            autofocus: widget.autofocus,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            keyboardType: _getKeyboardType(),
            textInputAction: widget.textInputAction,
            enableSuggestions: widget.enableSuggestions,
            autocorrect: widget.autocorrect,
            style: _getTextStyle(context),
            decoration: _buildInputDecoration(context, hasError),
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            onTap: widget.onTap,
            validator: widget.validator,
            onTapOutside: (_) => _unfocus(),
          ),
        ),
        
        // Helper text or error
        if (widget.helperText != null && !hasError) ...[
          AppSpacing.xsVerticalGap,
          Text(
            widget.helperText!,
            style: textStyle.caption.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
        
        if (hasError) ...[
          AppSpacing.xsVerticalGap,
          Row(
            children: [
              Icon(
                AppIcons.error,
                size: AppSizes.iconSizeSm,
                color: colors.error,
              ),
              AppSpacing.xsHorizontalGap,
              Expanded(
                child: Text(
                  widget.errorText!,
                  style: textStyle.caption.copyWith(
                    color: colors.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  BoxDecoration _buildFieldDecoration(BuildContext context, bool hasError) {
    final colors = context.colors;
    final isEnabled = !widget.isDisabled;
    
    Color borderColor;
    Color backgroundColor;
    
    if (!isEnabled) {
      borderColor = colors.disabled;
      backgroundColor = colors.surface.withValues(alpha: AppOpacities.disabled);
    } else if (hasError) {
      borderColor = colors.error;
      backgroundColor = colors.surface;
    } else if (_isFocused) {
      borderColor = colors.primary;
      backgroundColor = colors.surface;
    } else {
      borderColor = colors.outline;
      backgroundColor = colors.surface;
    }
    
    return BoxDecoration(
      color: backgroundColor,
              borderRadius: AppRadius.defaultRadius.mdRadius,
      border: Border.all(
        color: borderColor,
        width: _isFocused ? AppSizes.borderWidthThick : AppSizes.borderWidth,
      ),
      boxShadow: _isFocused ? [
        BoxShadow(
          color: colors.primary.withValues(alpha: AppOpacities.focus),
          blurRadius: AppSizes.shadowRadius,
          offset: Offset(0, AppSizes.shadowOffset),
        ),
      ] : null,
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context, bool hasError) {
    final colors = context.colors;
    final isEnabled = !widget.isDisabled;
    
    Color iconColor = isEnabled ? colors.textSecondary : colors.textTertiary;
    if (hasError) iconColor = colors.error;
    
    return InputDecoration(
      hintText: widget.hint,
      hintStyle: _getTextStyle(context).copyWith(
        color: colors.textTertiary,
      ),
      border: InputBorder.none,
      contentPadding: _getContentPadding(context),
      prefixIcon: widget.prefixIcon != null ? Icon(
        widget.prefixIcon,
        size: _getIconSize(context),
        color: iconColor,
      ) : null,
      suffixIcon: _buildSuffixIcon(context, iconColor),
      counterText: '', // Hide character counter
    );
  }

  Widget? _buildSuffixIcon(BuildContext context, Color iconColor) {
    
    // Password visibility toggle
    if (widget.variant == AppTextFieldVariant.password) {
      return IconButton(
        icon: Icon(
          _isPasswordVisible ? AppIcons.visibilityOff : AppIcons.visibility,
          size: _getIconSize(context),
          color: iconColor,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      );
    }
    
    // Custom suffix icon
    if (widget.suffixIcon != null) {
      return Icon(
        widget.suffixIcon,
        size: _getIconSize(context),
        color: iconColor,
      );
    }
    
    return null;
  }

  TextStyle _getTextStyle(BuildContext context) {
    final textStyle = context.textStyle;
    
    switch (widget.size) {
      case AppTextFieldSize.sm:
        return textStyle.body2;
      case AppTextFieldSize.md:
        return textStyle.body1;
      case AppTextFieldSize.lg:
        return textStyle.body1.copyWith(fontSize: 16.0);
    }
  }

  EdgeInsets _getContentPadding(BuildContext context) {
    
    switch (widget.size) {
      case AppTextFieldSize.sm:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        );
      case AppTextFieldSize.md:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        );
      case AppTextFieldSize.lg:
        return EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        );
    }
  }

  double _getIconSize(BuildContext context) {
    switch (widget.size) {
      case AppTextFieldSize.sm:
        return AppSizes.iconSizeSm;
      case AppTextFieldSize.md:
        return AppSizes.iconSizeMd;
      case AppTextFieldSize.lg:
        return AppSizes.iconSizeLg;
    }
  }

  bool _getObscureText() {
    if (widget.variant == AppTextFieldVariant.password) {
      return !_isPasswordVisible;
    }
    return widget.obscureText;
  }

  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType!;
    }
    
    switch (widget.variant) {
      case AppTextFieldVariant.email:
        return TextInputType.emailAddress;
      case AppTextFieldVariant.password:
        return TextInputType.visiblePassword;
      case AppTextFieldVariant.search:
        return TextInputType.text;
      case AppTextFieldVariant.number:
        return TextInputType.number;
      case AppTextFieldVariant.phone:
        return TextInputType.phone;
      case AppTextFieldVariant.url:
        return TextInputType.url;
      case AppTextFieldVariant.text:
        return TextInputType.text;
    }
  }

  void _unfocus() {
    setState(() {
      _isFocused = false;
    });
  }
}

/// Text field variant enum
enum AppTextFieldVariant {
  text,
  email,
  password,
  search,
  number,
  phone,
  url,
}

/// Text field size enum
enum AppTextFieldSize {
  sm,
  md,
  lg,
} 