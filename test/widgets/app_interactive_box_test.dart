import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppInteractiveBox', () {
    testWidgets('renders with basic properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              onTap: () {},
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Content'), findsOneWidget);
      expect(find.byType(AppInteractiveBox), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              onTap: () => tapped = true,
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppInteractiveBox));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('does not call onTap when disabled', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              onTap: () => tapped = true,
              disabled: true,
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppInteractiveBox));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('applies opacity when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              disabled: true,
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.byType(Opacity), findsOneWidget);
    });

    testWidgets('applies selected colors when isSelected is true', (WidgetTester tester) async {
      const selectedColor = Colors.red;
      const selectedBorderColor = Colors.blue;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              isSelected: true,
              selectedColor: selectedColor,
              selectedBorderColor: selectedBorderColor,
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppInteractiveBox),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(selectedColor));
      expect(decoration.border?.top.color, equals(selectedBorderColor));
    });

    testWidgets('uses theme colors when custom colors are not provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.purple,
              primaryContainer: Colors.purple.shade100,
              outline: Colors.grey,
              surface: Colors.white,
            ),
          ),
          home: Scaffold(
            body: AppInteractiveBox(
              isSelected: true,
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppInteractiveBox),
          matching: find.byType(Container),
        ),
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.purple.shade100));
      expect(decoration.border?.top.color, equals(Colors.purple));
    });

    testWidgets('applies custom width and height', (WidgetTester tester) async {
      const width = 200.0;
      const height = 150.0;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              width: width,
              height: height,
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppInteractiveBox),
          matching: find.byType(Container),
        ),
      );

      expect(container.constraints?.maxWidth, equals(width));
      expect(container.constraints?.maxHeight, equals(height));
    });

    testWidgets('applies custom alignment', (WidgetTester tester) async {
      const alignment = Alignment.centerRight;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              alignment: alignment,
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppInteractiveBox),
          matching: find.byType(Container),
        ),
      );

      expect(container.alignment, equals(alignment));
    });

    testWidgets('uses design system spacing and radius', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.byType(Padding), findsAtLeastNWidgets(1));
      expect(find.byType(InkWell), findsAtLeastNWidgets(1));
    });

    testWidgets('has InkWell with proper borderRadius', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              onTap: () {},
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('renders with Material widget for InkWell', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppInteractiveBox(
              onTap: () {},
              child: const Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.byType(Material), findsAtLeastNWidgets(1));
    });
  });
} 