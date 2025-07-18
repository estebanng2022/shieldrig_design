import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppScreenBase', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('applies default padding using theme spacing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            child: Container(
              key: Key('test-container'),
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      );

      // Verify that padding is applied (should find Padding widget)
      expect(find.byType(Padding), findsWidgets);
      
      // Verify the container is rendered
      expect(find.byKey(Key('test-container')), findsOneWidget);
    });

    testWidgets('applies custom padding when provided', (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(16.0);
      
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            padding: customPadding,
            child: Container(
              key: Key('test-container'),
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      );

      expect(find.byType(Padding), findsWidgets);
      expect(find.byKey(Key('test-container')), findsOneWidget);
    });

    testWidgets('applies SafeArea when safeArea is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            safeArea: true,
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('does not apply SafeArea when safeArea is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            safeArea: false,
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(SafeArea), findsNothing);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('applies SingleChildScrollView when scrollable is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            scrollable: true,
            child: SizedBox(
              height: 2000, // Make it taller than screen
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('does not apply SingleChildScrollView when scrollable is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            scrollable: false,
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsNothing);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('applies maxWidth constraint when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            maxWidth: 500.0,
            child: Container(
              key: Key('test-container'),
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      );

      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(ConstrainedBox), findsWidgets);
      expect(find.byKey(Key('test-container')), findsOneWidget);
    });

    testWidgets('does not apply maxWidth constraint when not provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            child: Container(
              key: Key('test-container'),
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      );

      expect(find.byType(Center), findsNothing);
      // Note: ConstrainedBox might still exist from other widgets, so we don't test for it
      expect(find.byKey(Key('test-container')), findsOneWidget);
    });

    testWidgets('applies custom background color', (WidgetTester tester) async {
      const customColor = Colors.blue;
      
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            backgroundColor: customColor,
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Material), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('uses scaffold background color when no custom color provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.green,
          ),
          home: AppScreenBase(
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Material), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('combines all features correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            scrollable: true,
            safeArea: true,
            backgroundColor: Colors.purple,
            padding: EdgeInsets.all(32.0),
            maxWidth: 800.0,
            child: SizedBox(
              key: Key('test-container'),
              height: 2000,
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      // Should have all features applied
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(ConstrainedBox), findsWidgets);
      expect(find.byType(Material), findsOneWidget);
      expect(find.byKey(Key('test-container')), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('handles complex child widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppScreenBase(
            child: Column(
              children: [
                Text('Header'),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    child: Center(
                      child: Text('Centered Content'),
                    ),
                  ),
                ),
                Text('Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Centered Content'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });
  });
} 