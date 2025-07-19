import 'package:flutter/material.dart';
import '../../theme/extensions/context_extensions.dart';
import '../../theme/app_spacing.dart';
import '../app_screen_base.dart';
import 'default_settings_group.dart';
import 'settings_list_tile.dart';

/// Premium settings detail screen with complete groups
/// 
/// Complete settings screen with 7 organized groups and 16 items.
/// Ready for production with trailing text, danger styling, and premium UX.
class SettingsDetailScreen extends StatelessWidget {
  const SettingsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenBase(
      child: SingleChildScrollView(
        padding: AppSpacing.mdPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: AppSpacing.mdPadding,
              child: Text(
                'Settings',
                style: context.textStyle.heading3.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colors.primaryText,
                ),
              ),
            ),
            
            // 1. Account Group
            const DefaultSettingsGroup(
              title: 'Account',
              items: [
                SettingsListTile(
                  leading: Icon(Icons.person),
                  title: 'Edit Profile',
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.lock),
                  title: 'Change Password',
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.verified_user),
                  title: 'Account Security',
                  padding: AppSpacing.mdPadding,
                ),
              ],
            ),
            
            // 2. Notifications Group
            const DefaultSettingsGroup(
              title: 'Notifications',
              items: [
                SettingsListTile(
                  leading: Icon(Icons.notifications),
                  title: 'Push Notifications',
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.email),
                  title: 'Email Notifications',
                  padding: AppSpacing.mdPadding,
                ),
              ],
            ),
            
            // 3. Appearance Group
            DefaultSettingsGroup(
              title: 'Appearance',
              items: [
                SettingsListTile(
                  leading: Icon(Icons.palette),
                  title: 'Theme',
                  trailing: Text('Light'),
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.language),
                  title: 'Language',
                  trailing: Text('English'),
                  padding: AppSpacing.mdPadding,
                ),
              ],
            ),
            
            // 4. Privacy Group
            const DefaultSettingsGroup(
              title: 'Privacy',
              items: [
                SettingsListTile(
                  leading: Icon(Icons.security),
                  title: 'Data Permissions',
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.fingerprint),
                  title: 'Two-Factor Authentication',
                  padding: AppSpacing.mdPadding,
                ),
              ],
            ),
            
            // 5. Support Group
            const DefaultSettingsGroup(
              title: 'Support',
              items: [
                SettingsListTile(
                  leading: Icon(Icons.help_outline),
                  title: 'Help & FAQ',
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.support_agent),
                  title: 'Contact Support',
                  padding: AppSpacing.mdPadding,
                ),
              ],
            ),
            
            // 6. About Group
            DefaultSettingsGroup(
              title: 'About',
              items: [
                SettingsListTile(
                  leading: Icon(Icons.info),
                  title: 'App Version',
                  trailing: Text('v2.1.0'),
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.description),
                  title: 'Terms & Privacy',
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.star),
                  title: 'Rate App',
                  padding: AppSpacing.mdPadding,
                ),
              ],
            ),
            
            // 7. Account Actions Group (with danger styling)
            DefaultSettingsGroup(
              title: 'Account Actions',
              items: [
                SettingsListTile(
                  leading: Icon(Icons.logout),
                  title: 'Log Out',
                  textColor: context.colors.error,
                  iconColor: context.colors.error,
                  padding: AppSpacing.mdPadding,
                ),
                SettingsListTile(
                  leading: Icon(Icons.delete_outline),
                  title: 'Delete Account',
                  textColor: context.colors.error,
                  iconColor: context.colors.error,
                  padding: AppSpacing.mdPadding,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 