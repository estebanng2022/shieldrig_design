import 'package:flutter/material.dart';
import '../../theme/extensions/context_extensions.dart';
import '../../theme/app_spacing.dart';
import '../../widgets/app_button.dart';
import 'app_profile_avatar.dart';

/// Profile header widget displaying avatar, name, email and edit button
/// 
/// Premium layout with proper spacing and typography
class AppProfileHeader extends StatelessWidget {
  const AppProfileHeader({
    super.key,
    required this.fullName,
    required this.email,
    this.imageUrl,
    this.initials,
    this.onEditTap,
  });

  /// Full name to display
  final String fullName;

  /// Email address to display
  final String email;

  /// URL of the profile image
  final String? imageUrl;

  /// Initials to display when no image is provided
  final String? initials;

  /// Callback when edit button is tapped
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      padding: AppSpacing.lgPadding,
      child: Row(
        children: [
          // Avatar
          AppProfileAvatar(
            imageUrl: imageUrl,
            initials: initials,
            size: 72,
            isEditable: false,
          ),
          
          // Spacing between avatar and content
          AppSpacing.mdHorizontalGap,
          
          // Content (name, email, button)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  fullName,
                  style: textStyle.heading3.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.primaryText,
                  ),
                ),
                
                AppSpacing.smVerticalGap,
                
                // Email
                Text(
                  email,
                  style: textStyle.body1.copyWith(
                    color: colors.secondaryText,
                  ),
                ),
                
                AppSpacing.mdVerticalGap,
                
                // Edit Profile Button
                AppButton(
                  onPressed: onEditTap,
                  label: 'Edit Profile',
                  icon: Icons.edit,
                  variant: AppButtonVariant.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 