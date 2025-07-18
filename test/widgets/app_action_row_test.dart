import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppActionRow', () {
    testWidgets('renders all action items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () {},
                ),
                AppActionItem(
                  icon: Icons.add,
                  label: 'Add money',
                  onTap: () {},
                ),
                AppActionItem(
                  icon: Icons.download,
                  label: 'Withdraw',
                  onTap: () {},
                ),
                AppActionItem(
                  icon: Icons.more_horiz,
                  label: 'More',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Trade'), findsOneWidget);
      expect(find.text('Add money'), findsOneWidget);
      expect(find.text('Withdraw'), findsOneWidget);
      expect(find.text('More'), findsOneWidget);
      expect(find.byIcon(Icons.trending_up), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.download), findsOneWidget);
      expect(find.byIcon(Icons.more_horiz), findsOneWidget);
    });

    testWidgets('handles tap on action items', (WidgetTester tester) async {
      bool tradeTapped = false;
      bool addMoneyTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () => tradeTapped = true,
                ),
                AppActionItem(
                  icon: Icons.add,
                  label: 'Add money',
                  onTap: () => addMoneyTapped = true,
                ),
              ],
            ),
          ),
        ),
      );

      // Tap on Trade action
      await tester.tap(find.byIcon(Icons.trending_up));
      await tester.pump();
      expect(tradeTapped, true);

      // Tap on Add money action
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(addMoneyTapped, true);
    });

    testWidgets('applies custom spacing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              spacing: 32.0,
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () {},
                ),
                AppActionItem(
                  icon: Icons.add,
                  label: 'Add money',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies custom alignment', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              alignment: MainAxisAlignment.start,
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              padding: EdgeInsets.all(16.0),
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('applies background color and elevation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              backgroundColor: Colors.blue,
              elevation: 4.0,
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('shows divider when requested', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              showDivider: true,
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('handles disabled state', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () => tapped = true,
                  isDisabled: true,
                ),
              ],
            ),
          ),
        ),
      );

      // Tap should not trigger callback when disabled
      await tester.tap(find.byIcon(Icons.trending_up));
      await tester.pump();
      expect(tapped, false);
    });

    testWidgets('applies custom colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppActionRow(
              items: [
                AppActionItem(
                  icon: Icons.trending_up,
                  label: 'Trade',
                  onTap: () {},
                  iconColor: Colors.red,
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Icon), findsOneWidget);
    });
  });

  group('AppTradeActionRow', () {
    testWidgets('renders trade action row with default items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppTradeActionRow(),
          ),
        ),
      );

      expect(find.text('Trade'), findsOneWidget);
      expect(find.text('Add money'), findsOneWidget);
      expect(find.text('Withdraw'), findsOneWidget);
      expect(find.text('More'), findsOneWidget);
    });

    testWidgets('handles custom callbacks', (WidgetTester tester) async {
      bool tradeTapped = false;
      bool addMoneyTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppTradeActionRow(
              onTrade: () => tradeTapped = true,
              onAddMoney: () => addMoneyTapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.trending_up));
      await tester.pump();
      expect(tradeTapped, true);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(addMoneyTapped, true);
    });

    testWidgets('handles disabled state', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppTradeActionRow(
              onTrade: () => tapped = true,
              isDisabled: true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.trending_up));
      await tester.pump();
      expect(tapped, false);
    });
  });
} 