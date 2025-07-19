import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppProfileHeader', () {
    testWidgets('displays profile information correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppProfileHeader(
              fullName: 'John Doe',
              email: 'john.doe@example.com',
              imageUrl: 'https://example.com/avatar.jpg',
              initials: 'JD',
              onEditTap: () {},
            ),
          ),
        ),
      );

      // Verify name is displayed
      expect(find.text('John Doe'), findsOneWidget);
      
      // Verify email is displayed
      expect(find.text('john.doe@example.com'), findsOneWidget);
      
      // Verify edit button is displayed
      expect(find.text('Edit Profile'), findsOneWidget);
      
      // Verify avatar is present
      expect(find.byType(AppProfileAvatar), findsOneWidget);
    });

    testWidgets('displays profile without image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppProfileHeader(
              fullName: 'Jane Smith',
              email: 'jane.smith@example.com',
              initials: 'JS',
              onEditTap: () {},
            ),
          ),
        ),
      );

      // Verify name is displayed
      expect(find.text('Jane Smith'), findsOneWidget);
      
      // Verify email is displayed
      expect(find.text('jane.smith@example.com'), findsOneWidget);
      
      // Verify avatar is present
      expect(find.byType(AppProfileAvatar), findsOneWidget);
    });

    testWidgets('calls onEditTap when edit button is pressed', (WidgetTester tester) async {
      bool editTapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppProfileHeader(
              fullName: 'Test User',
              email: 'test@example.com',
              onEditTap: () => editTapped = true,
            ),
          ),
        ),
      );

      // Tap the edit button
      await tester.tap(find.text('Edit Profile'));
      await tester.pump();

      expect(editTapped, isTrue);
    });

    testWidgets('works without onEditTap callback', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppProfileHeader(
              fullName: 'Test User',
              email: 'test@example.com',
            ),
          ),
        ),
      );

      // Should not throw when tapping edit button without callback
      await tester.tap(find.text('Edit Profile'));
      await tester.pump();

      // Verify widget is still rendered
      expect(find.text('Test User'), findsOneWidget);
    });

    testWidgets('uses theme colors and spacing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppProfileHeader(
              fullName: 'Theme Test',
              email: 'theme@test.com',
            ),
          ),
        ),
      );

      // Verify the widget renders without errors
      expect(find.byType(AppProfileHeader), findsOneWidget);
      
      // Verify avatar uses correct size
      final avatar = tester.widget<AppProfileAvatar>(find.byType(AppProfileAvatar));
      expect(avatar.size, equals(72.0));
    });

    testWidgets('handles empty name and email', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppProfileHeader(
              fullName: '',
              email: '',
            ),
          ),
        ),
      );

      // Should render without errors
      expect(find.byType(AppProfileHeader), findsOneWidget);
    });
  });
} 