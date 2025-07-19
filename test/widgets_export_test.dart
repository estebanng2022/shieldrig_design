import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('Widget Exports', () {
    test('should be able to import all theme components', () {
      // Theme components
      expect(() => AppColors.light, returnsNormally);
      expect(() => AppTextStyle.defaultTextStyle, returnsNormally);
      expect(() => AppSpacing.md, returnsNormally);
      expect(() => AppSizes.iconSizeMd, returnsNormally);
      expect(() => AppRadius.defaultRadius, returnsNormally);
      expect(() => AppOpacities.shadow, returnsNormally);
      expect(() => AppIcons.home, returnsNormally);
      expect(() => AppBreakpoints.mobile, returnsNormally);
      expect(() => AppDurations.fast, returnsNormally);
    });

    test('should be able to import all widget classes', () {
      // This test verifies that all widget classes can be imported
      // If any widget is not properly exported, this test will fail
      
      // Basic widgets
      expect(() => AppButton, returnsNormally);
      expect(() => AppTextField, returnsNormally);
      expect(() => AppCard, returnsNormally);
      expect(() => AppSnackbar, returnsNormally);
      
      // Section widgets
      expect(() => AppContentSection, returnsNormally);
      expect(() => AppContentGroup, returnsNormally);
      expect(() => AppFormSection, returnsNormally);
      expect(() => AppHeaderSection, returnsNormally);
      expect(() => AppActionSection, returnsNormally);
      expect(() => AppActionRow, returnsNormally);
      
      // Utility widgets
      expect(() => AppScreenBase, returnsNormally);
      expect(() => AppDivider, returnsNormally);
      expect(() => AppBottomSheet, returnsNormally);
      expect(() => AppInteractiveBox, returnsNormally);
      
      // Navigation widgets
      expect(() => AppBottomNavBar, returnsNormally);
      
      // Profile widgets
      expect(() => AppProfileAvatar, returnsNormally);
      expect(() => AppProfileHeader, returnsNormally);
      
      // Settings widgets
      expect(() => SettingsSectionCard, returnsNormally);
      expect(() => SettingsListTile, returnsNormally);
      
      // Notice card widgets
      expect(() => AppNoticeCard, returnsNormally);
    });
  });
} 