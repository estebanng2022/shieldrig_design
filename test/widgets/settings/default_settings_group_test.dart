import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('DefaultSettingsGroup', () {
    testWidgets('renders with title and items', (WidgetTester tester) async {
      final items = [
        SettingsListTile(
          icon: Icons.person,
          title: 'Profile',
          padding: const EdgeInsets.all(16),
        ),
        SettingsListTile(
          icon: Icons.lock,
          title: 'Privacy',
          padding: const EdgeInsets.all(16),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultSettingsGroup(
              title: 'Account',
              items: items,
            ),
          ),
        ),
      );

      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Privacy'), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.lock), findsOneWidget);
    });

    testWidgets('renders with custom padding', (WidgetTester tester) async {
      final customPadding = const EdgeInsets.all(24);
      final items = [
        SettingsListTile(
          icon: Icons.settings,
          title: 'Settings',
          padding: const EdgeInsets.all(16),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultSettingsGroup(
              title: 'General',
              items: items,
              padding: customPadding,
            ),
          ),
        ),
      );

      expect(find.text('General'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('renders with default padding when not specified', (WidgetTester tester) async {
      final items = [
        SettingsListTile(
          icon: Icons.info,
          title: 'About',
          padding: const EdgeInsets.all(16),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultSettingsGroup(
              title: 'Support',
              items: items,
            ),
          ),
        ),
      );

      expect(find.text('Support'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('renders empty group', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultSettingsGroup(
              title: 'Empty Group',
              items: [],
            ),
          ),
        ),
      );

      expect(find.text('Empty Group'), findsOneWidget);
    });

    testWidgets('uses SettingsSectionCard as base', (WidgetTester tester) async {
      final items = [
        SettingsListTile(
          icon: Icons.home,
          title: 'Home',
          padding: const EdgeInsets.all(16),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultSettingsGroup(
              title: 'Navigation',
              items: items,
            ),
          ),
        ),
      );

      // Should have SettingsSectionCard
      expect(find.byType(SettingsSectionCard), findsOneWidget);
      
      // Should have SettingsListTile items
      expect(find.byType(SettingsListTile), findsOneWidget);
    });

    testWidgets('maintains proper structure', (WidgetTester tester) async {
      final items = [
        SettingsListTile(
          icon: Icons.notifications,
          title: 'Notifications',
          padding: const EdgeInsets.all(16),
        ),
        SettingsListTile(
          icon: Icons.email,
          title: 'Email',
          padding: const EdgeInsets.all(16),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DefaultSettingsGroup(
              title: 'Preferences',
              items: items,
            ),
          ),
        ),
      );

      // Should have title
      expect(find.text('Preferences'), findsOneWidget);
      
      // Should have all items
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
      
      // Should have correct number of SettingsListTile widgets
      expect(find.byType(SettingsListTile), findsNWidgets(2));
    });
  });
} 