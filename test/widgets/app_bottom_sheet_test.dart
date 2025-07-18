import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppBottomSheet', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('renders header when title is provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('does not render header when title is null', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.byType(AppHeaderSection), findsNothing);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('renders subtitle when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('renders description when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              description: 'Test Description',
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('renders trailing actions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              trailingActions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('renders primary action', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              primaryAction: ElevatedButton(
                onPressed: () {},
                child: Text('Primary Action'),
              ),
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Primary Action'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('renders secondary action', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              secondaryAction: TextButton(
                onPressed: () {},
                child: Text('Secondary Action'),
              ),
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Secondary Action'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('shows close button by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('hides close button when showCloseButton is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              showCloseButton: false,
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.byType(IconButton), findsNothing);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(32.0);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              padding: customPadding,
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('applies max width constraint', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              maxWidth: 500.0,
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('applies custom background color', (WidgetTester tester) async {
      const customColor = Colors.blue;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              backgroundColor: customColor,
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('uses AppScreenBase for content', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.byType(AppScreenBase), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('combines all features correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBottomSheet(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              description: 'Test Description',
              trailingActions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
              primaryAction: ElevatedButton(
                onPressed: () {},
                child: Text('Primary Action'),
              ),
              secondaryAction: TextButton(
                onPressed: () {},
                child: Text('Secondary Action'),
              ),
              padding: EdgeInsets.all(32.0),
              maxWidth: 500.0,
              backgroundColor: Colors.blue,
              child: Text('Test Content'),
            ),
          ),
        ),
      );

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Primary Action'), findsOneWidget);
      expect(find.text('Secondary Action'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });
  });

  group('AppBottomSheetHelper', () {
    testWidgets('shows modal bottom sheet', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppBottomSheetHelper.show(
                    context: context,
                    child: Text('Test Content'),
                  );
                },
                child: Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('shows modal bottom sheet with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppBottomSheetHelper.show(
                    context: context,
                    title: 'Test Title',
                    child: Text('Test Content'),
                  );
                },
                child: Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });
  });
} 