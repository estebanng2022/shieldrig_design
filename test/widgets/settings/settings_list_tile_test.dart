import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('SettingsListTile', () {
    testWidgets('renders with required props', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsListTile(
              icon: Icons.settings,
              title: 'Test Settings',
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),
      );

      expect(find.text('Test Settings'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('renders with trailing text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsListTile(
              icon: Icons.notifications,
              title: 'Notifications',
              trailingText: 'On',
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),
      );

      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('On'), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsListTile(
              icon: Icons.privacy_tip,
              title: 'Privacy',
              padding: const EdgeInsets.all(16),
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SettingsListTile));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not show trailing text when null', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsListTile(
              icon: Icons.help,
              title: 'Help & Support',
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),
      );

      expect(find.text('Help & Support'), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
      
      // Should not find any trailing text
      expect(find.byType(Text), findsNWidgets(1)); // only title
    });

    testWidgets('uses correct padding', (WidgetTester tester) async {
      const customPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 12);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsListTile(
              icon: Icons.account_circle,
              title: 'Account',
              padding: customPadding,
            ),
          ),
        ),
      );

      final cardFinder = find.byType(AppCard);
      expect(cardFinder, findsOneWidget);

      final card = tester.widget<AppCard>(cardFinder);
      expect(card.padding, equals(customPadding));
    });

    testWidgets('uses flat variant', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsListTile(
              icon: Icons.security,
              title: 'Security',
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),
      );

      final cardFinder = find.byType(AppCard);
      final card = tester.widget<AppCard>(cardFinder);
      expect(card.variant, equals(AppCardVariant.flat));
    });

    testWidgets('has proper layout structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SettingsListTile(
              icon: Icons.language,
              title: 'Language',
              trailingText: 'English',
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),
      );

      // Should have a Row with proper children
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);

      // Should have icon, text, spacer, trailing text, and chevron
      expect(find.byIcon(Icons.language), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });
  });
} 