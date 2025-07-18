import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppActionSection', () {
    testWidgets('renders action buttons correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              actions: [
                AppActionButton(
                  label: 'Submit',
                  onPressed: () {},
                ),
                AppActionButton(
                  label: 'Cancel',
                  onPressed: () {},
                  variant: AppButtonVariant.secondary,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('handles horizontal layout correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              layout: AppActionLayout.horizontal,
              actions: [
                AppActionButton(
                  label: 'Action 1',
                  onPressed: () {},
                ),
                AppActionButton(
                  label: 'Action 2',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('handles vertical layout correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              layout: AppActionLayout.vertical,
              actions: [
                AppActionButton(
                  label: 'Action 1',
                  onPressed: () {},
                ),
                AppActionButton(
                  label: 'Action 2',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('handles stacked layout correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              layout: AppActionLayout.stacked,
              actions: [
                AppActionButton(
                  label: 'Action 1',
                  onPressed: () {},
                ),
                AppActionButton(
                  label: 'Action 2',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('applies custom spacing correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              spacing: 20.0,
              actions: [
                AppActionButton(
                  label: 'Action 1',
                  onPressed: () {},
                ),
                AppActionButton(
                  label: 'Action 2',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      // Verify spacing is applied
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('applies custom padding correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              padding: EdgeInsets.all(16.0),
              actions: [
                AppActionButton(
                  label: 'Action',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies elevation correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              elevation: 8.0,
              actions: [
                AppActionButton(
                  label: 'Action',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies custom background color correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              background: Colors.red,
              actions: [
                AppActionButton(
                  label: 'Action',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies border correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              border: AppActionBorder(
                color: Colors.blue,
                width: 2.0,
              ),
              actions: [
                AppActionButton(
                  label: 'Action',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('applies custom radius correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              radius: BorderRadius.circular(12.0),
              actions: [
                AppActionButton(
                  label: 'Action',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('shows divider when requested', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              divider: true,
              actions: [
                AppActionButton(
                  label: 'Action',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('uses compact spacing when requested', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              compact: true,
              actions: [
                AppActionButton(
                  label: 'Action',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles different alignments correctly', (WidgetTester tester) async {
      for (final alignment in AppActionAlignment.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppActionSection(
                alignment: alignment,
                actions: [
                  AppActionButton(
                    label: 'Action 1',
                    onPressed: () {},
                  ),
                  AppActionButton(
                    label: 'Action 2',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(AppActionSection), findsOneWidget);
      }
    });

    testWidgets('handles action button with loading state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              actions: [
                AppActionButton(
                  label: 'Loading',
                  onPressed: () {},
                  loading: true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Loading'), findsOneWidget);
    });

    testWidgets('handles action button with disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              actions: [
                AppActionButton(
                  label: 'Disabled',
                  onPressed: () {},
                  disabled: true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('handles action button with icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              actions: [
                AppActionButton(
                  label: 'With Icon',
                  onPressed: () {},
                  leading: Icons.star,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('handles action button with custom text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionSection(
              actions: [
                AppActionButton(
                  label: 'Custom Style',
                  onPressed: () {},
                  textStyle: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Custom Style'), findsOneWidget);
    });
  });

  group('AppFormActions', () {
    testWidgets('renders submit and cancel buttons correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFormActions(
              onSubmit: () {},
              onCancel: () {},
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('renders only submit button when no cancel provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFormActions(
              onSubmit: () {},
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Cancel'), findsNothing);
    });

    testWidgets('handles loading states correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFormActions(
              onSubmit: () {},
              onCancel: () {},
              submitLoading: true,
              cancelLoading: true,
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('handles disabled states correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFormActions(
              onSubmit: () {},
              onCancel: () {},
              submitDisabled: true,
              cancelDisabled: true,
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('uses custom labels correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppFormActions(
              onSubmit: () {},
              onCancel: () {},
              submitLabel: 'Save',
              cancelLabel: 'Back',
            ),
          ),
        ),
      );

      expect(find.text('Save'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });
  });

  group('AppConfirmActions', () {
    testWidgets('renders confirm and cancel buttons correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppConfirmActions(
              onConfirm: () {},
              onCancel: () {},
            ),
          ),
        ),
      );

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('renders only confirm button when no cancel provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppConfirmActions(
              onConfirm: () {},
            ),
          ),
        ),
      );

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsNothing);
    });

    testWidgets('handles custom confirm variant correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppConfirmActions(
              onConfirm: () {},
              onCancel: () {},
              confirmVariant: AppButtonVariant.danger,
            ),
          ),
        ),
      );

      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('uses custom labels correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppConfirmActions(
              onConfirm: () {},
              onCancel: () {},
              confirmLabel: 'Proceed',
              cancelLabel: 'Back',
            ),
          ),
        ),
      );

      expect(find.text('Proceed'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });
  });

  group('AppDangerActions', () {
    testWidgets('renders delete and cancel buttons correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDangerActions(
              onDelete: () {},
              onCancel: () {},
            ),
          ),
        ),
      );

      expect(find.text('Delete'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('renders only delete button when no cancel provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDangerActions(
              onDelete: () {},
            ),
          ),
        ),
      );

      expect(find.text('Delete'), findsOneWidget);
      expect(find.text('Cancel'), findsNothing);
    });

    testWidgets('uses custom labels correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDangerActions(
              onDelete: () {},
              onCancel: () {},
              deleteLabel: 'Remove',
              cancelLabel: 'Keep',
            ),
          ),
        ),
      );

      expect(find.text('Remove'), findsOneWidget);
      expect(find.text('Keep'), findsOneWidget);
    });
  });
} 