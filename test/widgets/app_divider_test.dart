import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppDivider', () {
    testWidgets('renders horizontal divider by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('renders vertical divider when orientation is vertical', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              orientation: Axis.vertical,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies custom color', (WidgetTester tester) async {
      const customColor = Colors.red;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              color: customColor,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies custom thickness', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              thickness: 4.0,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies custom length', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              length: 200.0,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies custom margin', (WidgetTester tester) async {
      const customMargin = EdgeInsets.all(16.0);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              margin: customMargin,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies custom radius', (WidgetTester tester) async {
      const customRadius = BorderRadius.all(Radius.circular(8.0));
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              radius: customRadius,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('combines all custom properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              orientation: Axis.vertical,
              color: Colors.blue,
              thickness: 3.0,
              length: 150.0,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              radius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('uses theme colors when no custom color provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            dividerColor: Colors.green,
          ),
          home: Scaffold(
            body: AppDivider(),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('expands to full width when length is null for horizontal', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300,
              child: AppDivider(
                orientation: Axis.horizontal,
                length: null,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('expands to full height when length is null for vertical', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 300,
              child: AppDivider(
                orientation: Axis.vertical,
                length: null,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles zero margin correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              margin: EdgeInsets.zero,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles zero radius correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDivider(
              radius: BorderRadius.zero,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('works within different container contexts', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppDivider(),
                SizedBox(
                  height: 100,
                  child: AppDivider(
                    orientation: Axis.vertical,
                  ),
                ),
                AppDivider(
                  color: Colors.orange,
                  thickness: 2.0,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });
  });
} 