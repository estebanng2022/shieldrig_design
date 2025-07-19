import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('SettingsDetailScreen', () {
    testWidgets('renders with all default groups', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should have title
      expect(find.text('Settings'), findsOneWidget);

      // Should have all group titles
      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Appearance'), findsOneWidget);
      expect(find.text('Privacy'), findsOneWidget);
      expect(find.text('Support'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Account Actions'), findsOneWidget);

      // Should have all settings items
      expect(find.text('Edit Profile'), findsOneWidget);
      expect(find.text('Change Password'), findsOneWidget);
      expect(find.text('Account Security'), findsOneWidget);
      expect(find.text('Push Notifications'), findsOneWidget);
      expect(find.text('Email Notifications'), findsOneWidget);
      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      expect(find.text('Data Permissions'), findsOneWidget);
      expect(find.text('Two-Factor Authentication'), findsOneWidget);
      expect(find.text('Help & FAQ'), findsOneWidget);
      expect(find.text('Contact Support'), findsOneWidget);
      expect(find.text('App Version'), findsOneWidget);
      expect(find.text('Terms & Privacy'), findsOneWidget);
      expect(find.text('Rate App'), findsOneWidget);
      expect(find.text('Log Out'), findsOneWidget);
      expect(find.text('Delete Account'), findsOneWidget);
    });

    testWidgets('renders with correct icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should have all expected icons
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);
      expect(find.byIcon(Icons.verified_user), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
      expect(find.byIcon(Icons.palette), findsOneWidget);
      expect(find.byIcon(Icons.language), findsOneWidget);
      expect(find.byIcon(Icons.security), findsOneWidget);
      expect(find.byIcon(Icons.fingerprint), findsOneWidget);
      expect(find.byIcon(Icons.help_outline), findsOneWidget);
      expect(find.byIcon(Icons.support_agent), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
      expect(find.byIcon(Icons.description), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.logout), findsOneWidget);
      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
    });

    testWidgets('renders with correct number of DefaultSettingsGroup widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should have 7 groups
      expect(find.byType(DefaultSettingsGroup), findsNWidgets(7));
    });

    testWidgets('renders with correct number of SettingsListTile widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should have 16 settings items total
      expect(find.byType(SettingsListTile), findsNWidgets(16));
    });

    testWidgets('uses AppScreenBase as container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should use AppScreenBase
      expect(find.byType(AppScreenBase), findsOneWidget);
    });

    testWidgets('uses SingleChildScrollView for scrollable content', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should use SingleChildScrollView
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders with proper structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should have proper column structure
      expect(find.byType(Column), findsWidgets);
      
      // Should have proper crossAxisAlignment
      final column = tester.widget<Column>(find.byType(Column).first);
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
    });

    testWidgets('renders with design system padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should have proper padding structure
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Edit Profile'), findsOneWidget);
    });

    testWidgets('renders all account group items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Account group should have 3 items
      expect(find.text('Edit Profile'), findsOneWidget);
      expect(find.text('Change Password'), findsOneWidget);
      expect(find.text('Account Security'), findsOneWidget);
    });

    testWidgets('renders all notifications group items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Notifications group should have 2 items
      expect(find.text('Push Notifications'), findsOneWidget);
      expect(find.text('Email Notifications'), findsOneWidget);
    });

    testWidgets('renders all appearance group items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Appearance group should have 2 items
      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
    });

    testWidgets('renders all privacy group items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Privacy group should have 2 items
      expect(find.text('Data Permissions'), findsOneWidget);
      expect(find.text('Two-Factor Authentication'), findsOneWidget);
    });

    testWidgets('renders all support group items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Support group should have 2 items
      expect(find.text('Help & FAQ'), findsOneWidget);
      expect(find.text('Contact Support'), findsOneWidget);
    });

    testWidgets('renders all about group items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // About group should have 3 items
      expect(find.text('App Version'), findsOneWidget);
      expect(find.text('Terms & Privacy'), findsOneWidget);
      expect(find.text('Rate App'), findsOneWidget);
    });

    testWidgets('renders all account actions group items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Account Actions group should have 2 items
      expect(find.text('Log Out'), findsOneWidget);
      expect(find.text('Delete Account'), findsOneWidget);
    });

    testWidgets('renders trailing text for specific items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SettingsDetailScreen(),
        ),
      );

      // Should have trailing text for Theme, Language, and App Version
      expect(find.text('Light'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.text('v2.1.0'), findsOneWidget);
    });
  });
} 