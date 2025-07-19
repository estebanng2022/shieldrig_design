import 'package:flutter/material.dart';
import '../../../theme/app_spacing.dart';
import '../../../theme/extensions/context_extensions.dart';
import '../../app_screen_base.dart';
import '../../app_button.dart';
import '../../app_bottom_sheet.dart';

/// Settings tab widget for dashboard
/// 
/// Premium settings page using design system widgets.
/// Ready for content implementation with multiple sections.
class AppSettingsTab extends StatelessWidget {
  const AppSettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenBase(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Settings sections will be implemented here
            // Example structure:
            // SettingsSectionCard(
            //   title: 'Account & Profile',
            //   padding: AppSpacing.mdPadding,
            //   child: Column(
            //     children: [
            //       SettingsListTile(
            //         icon: Icons.person,
            //         title: 'Profile Picture',
            //         padding: AppSpacing.mdPadding,
            //         onTap: () {},
            //       ),
            //       // More settings items...
            //     ],
            //   ),
            // ),
            
            // Placeholder for future implementation
            Container(
              padding: AppSpacing.mdPadding,
              child: Text(
                'Settings content will be implemented here',
                style: context.textStyle.body1.copyWith(
                  color: context.colors.secondaryText,
                ),
              ),
            ),
            
            // Log Out button at the bottom
            AppSpacing.lgVerticalGap,
            Padding(
              padding: AppSpacing.mdPadding,
              child: AppButton(
                label: 'Log Out',
                variant: AppButtonVariant.danger,
                onPressed: () {
                  _showLogOutSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogOutSheet(BuildContext context) {
    AppBottomSheetHelper.show(
      context: context,
      title: 'Log Out',
      child: Container(
        padding: AppSpacing.mdPadding,
        child: Text(
          'Log out sheet content will be implemented here',
          style: context.textStyle.body1.copyWith(
            color: context.colors.secondaryText,
          ),
        ),
      ),
    );
  }
} 