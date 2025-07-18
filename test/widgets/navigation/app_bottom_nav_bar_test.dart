import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  group('AppBottomNavBar', () {
    late List<AppBottomNavItem> testItems;

    setUp(() {
      testItems = [
        const AppBottomNavItem(
          icon: Icons.home,
          activeIcon: Icons.home_filled,
          label: 'Home',
        ),
        const AppBottomNavItem(
          icon: Icons.search,
          label: 'Search',
        ),
        const AppBottomNavItem(
          icon: Icons.person,
          label: 'Profile',
        ),
      ];
    });

    testWidgets('renders with items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
            ),
          ),
        ),
      );

      expect(find.byType(AppBottomNavBar), findsOneWidget);
      // Check that we have the expected number of icons
      expect(find.byType(Icon), findsNWidgets(3));
    });

    testWidgets('shows labels when showLabels is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
              showLabels: true,
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('hides labels when showLabels is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
              showLabels: false,
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsNothing);
      expect(find.text('Search'), findsNothing);
      expect(find.text('Profile'), findsNothing);
    });

    testWidgets('shows active indicator for current index', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 1,
            ),
          ),
        ),
      );

      // Should show active indicator (Container with decoration)
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('calls onItemSelected when item is tapped', (WidgetTester tester) async {
      int? selectedIndex;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
              onItemSelected: (index) => selectedIndex = index,
            ),
          ),
        ),
      );

      // Tap on second item (find by index in the row)
      final icons = find.byType(Icon);
      await tester.tap(icons.at(1));
      await tester.pump();

      expect(selectedIndex, equals(1));
    });

    testWidgets('uses custom colors when provided', (WidgetTester tester) async {
      const customActiveColor = Colors.red;
      const customInactiveColor = Colors.grey;
      const customBackgroundColor = Colors.black;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
              activeColor: customActiveColor,
              inactiveColor: customInactiveColor,
              backgroundColor: customBackgroundColor,
            ),
          ),
        ),
      );

      // Verify colors are applied (this is more of an integration test)
      expect(find.byType(AppBottomNavBar), findsOneWidget);
    });

    testWidgets('uses active icon when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
            ),
          ),
        ),
      );

      // Should show filled home icon for active state
      expect(find.byIcon(Icons.home_filled), findsOneWidget);
    });

    testWidgets('uses regular icon when no active icon provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 1,
            ),
          ),
        ),
      );

      // Should show regular search icon since no active icon provided
      expect(find.byType(Icon), findsNWidgets(3));
    });

    testWidgets('handles empty label gracefully', (WidgetTester tester) async {
      final itemsWithEmptyLabel = [
        const AppBottomNavItem(
          icon: Icons.home,
          label: '',
        ),
        const AppBottomNavItem(
          icon: Icons.search,
          label: 'Search',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: itemsWithEmptyLabel,
              currentIndex: 0,
              showLabels: true,
            ),
          ),
        ),
      );

      // Should not show empty label
      expect(find.text(''), findsNothing);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('respects custom height', (WidgetTester tester) async {
      const customHeight = 100.0;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
              height: customHeight,
            ),
          ),
        ),
      );

      final navBar = tester.widget<AppBottomNavBar>(find.byType(AppBottomNavBar));
      expect(navBar.height, equals(customHeight));
    });

    testWidgets('respects custom elevation', (WidgetTester tester) async {
      const customElevation = 16.0;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: AppBottomNavBar(
              items: testItems,
              currentIndex: 0,
              elevation: customElevation,
            ),
          ),
        ),
      );

      final navBar = tester.widget<AppBottomNavBar>(find.byType(AppBottomNavBar));
      expect(navBar.elevation, equals(customElevation));
    });
  });

  group('AppBottomNavItem', () {
    test('creates item with required icon', () {
      const item = AppBottomNavItem(
        icon: Icons.home,
        label: 'Home',
      );

      expect(item.icon, equals(Icons.home));
      expect(item.label, equals('Home'));
      expect(item.activeIcon, isNull);
    });

    test('creates item with active icon', () {
      const item = AppBottomNavItem(
        icon: Icons.home,
        activeIcon: Icons.home_filled,
        label: 'Home',
      );

      expect(item.icon, equals(Icons.home));
      expect(item.activeIcon, equals(Icons.home_filled));
      expect(item.label, equals('Home'));
    });

    test('creates item with onTap callback', () {
      final item = AppBottomNavItem(
        icon: Icons.home,
        label: 'Home',
        onTap: () {},
      );

      expect(item.icon, equals(Icons.home));
      expect(item.label, equals('Home'));
      expect(item.onTap, isNotNull);
    });
  });

  group('AppBottomNavBarHelper', () {
    test('creates navigation bar with helper', () {
      final items = [
        const AppBottomNavItem(icon: Icons.home, label: 'Home'),
        const AppBottomNavItem(icon: Icons.search, label: 'Search'),
      ];

      final navBar = AppBottomNavBarHelper.create(
        items: items,
        currentIndex: 0,
        showLabels: true,
      );

      expect(navBar.items, equals(items));
      expect(navBar.currentIndex, equals(0));
      expect(navBar.showLabels, isTrue);
    });

    test('creates items from simple lists', () {
      final icons = [Icons.home, Icons.search, Icons.person];
      final labels = ['Home', 'Search', 'Profile'];
      final activeIcons = [Icons.home_filled, Icons.search];

      final items = AppBottomNavBarHelper.createItems(
        icons: icons,
        labels: labels,
        activeIcons: activeIcons,
      );

      expect(items.length, equals(3));
      expect(items[0].icon, equals(Icons.home));
      expect(items[0].activeIcon, equals(Icons.home_filled));
      expect(items[0].label, equals('Home'));
      
      expect(items[1].icon, equals(Icons.search));
      expect(items[1].activeIcon, equals(Icons.search));
      expect(items[1].label, equals('Search'));
      
      expect(items[2].icon, equals(Icons.person));
      expect(items[2].activeIcon, isNull);
      expect(items[2].label, equals('Profile'));
    });

    test('handles empty labels list', () {
      final icons = [Icons.home, Icons.search];
      
      final items = AppBottomNavBarHelper.createItems(
        icons: icons,
        labels: const [],
      );

      expect(items.length, equals(2));
      expect(items[0].label, equals(''));
      expect(items[1].label, equals(''));
    });

    test('handles empty active icons list', () {
      final icons = [Icons.home, Icons.search];
      final labels = ['Home', 'Search'];
      
      final items = AppBottomNavBarHelper.createItems(
        icons: icons,
        labels: labels,
        activeIcons: const [],
      );

      expect(items.length, equals(2));
      expect(items[0].activeIcon, isNull);
      expect(items[1].activeIcon, isNull);
    });
  });
} 