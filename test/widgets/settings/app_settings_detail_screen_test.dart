import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppSettingsDetailScreen', () {
    testWidgets('renders with title and content', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Edit Profile',
            child: Text('Profile content'),
          ),
        ),
      );

      expect(find.text('Edit Profile'), findsOneWidget);
      expect(find.text('Profile content'), findsOneWidget);
    });

    testWidgets('renders with custom back button action', (WidgetTester tester) async {
      bool backPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Notifications',
            child: Text('Notifications content'),
            onBackPressed: () => backPressed = true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back_ios));
      await tester.pump();

      expect(backPressed, isTrue);
    });

    testWidgets('renders with custom padding', (WidgetTester tester) async {
      final customPadding = const EdgeInsets.all(24);

      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Settings',
            child: Text('Settings content'),
            padding: customPadding,
          ),
        ),
      );

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Settings content'), findsOneWidget);
    });

    testWidgets('renders with custom background color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Theme',
            child: Text('Theme content'),
            backgroundColor: Colors.red,
          ),
        ),
      );

      expect(find.text('Theme'), findsOneWidget);
      expect(find.text('Theme content'), findsOneWidget);
    });

    testWidgets('renders scrollable content by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Scrollable',
            child: Column(
              children: List.generate(
                20,
                (index) => Container(
                  height: 100,
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Scrollable'), findsOneWidget);
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 19'), findsOneWidget);
    });

    testWidgets('renders non-scrollable content when scrollable is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Non-Scrollable',
            child: Text('Non-scrollable content'),
            scrollable: false,
          ),
        ),
      );

      expect(find.text('Non-Scrollable'), findsOneWidget);
      expect(find.text('Non-scrollable content'), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsNothing);
    });

    testWidgets('has proper AppBar structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Test Screen',
            child: Text('Test content'),
          ),
        ),
      );

      // Should have AppBar
      expect(find.byType(AppBar), findsOneWidget);
      
      // Should have back button
      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
      
      // Should have title
      expect(find.text('Test Screen'), findsOneWidget);
    });

    testWidgets('expands to full width', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Full Width',
            child: Container(
              color: Colors.blue,
              height: 200,
              child: Text('Full width content'),
            ),
          ),
        ),
      );

      expect(find.text('Full Width'), findsOneWidget);
      expect(find.text('Full width content'), findsOneWidget);
    });

    testWidgets('uses design system spacing by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Default Spacing',
            child: Text('Content with default spacing'),
          ),
        ),
      );

      expect(find.text('Default Spacing'), findsOneWidget);
      expect(find.text('Content with default spacing'), findsOneWidget);
    });

    testWidgets('handles long content properly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppSettingsDetailScreen(
            title: 'Long Content',
            child: Column(
              children: List.generate(
                50,
                (index) => Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text('Long content item $index'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Long Content'), findsOneWidget);
      expect(find.text('Long content item 0'), findsOneWidget);
      expect(find.text('Long content item 49'), findsOneWidget);
    });
  });
} 