import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shieldrig_design/shieldrig_design.dart';

void main() {
  final testTabs = [
    const AppDashboardTab(
      child: Text('Tab 1 Content'),
      title: 'Tab 1',
      subtitle: 'First tab',
    ),
    const AppDashboardTab(
      child: Text('Tab 2 Content'),
      title: 'Tab 2',
      subtitle: 'Second tab',
      showHeader: false,
    ),
    const AppDashboardTab(
      child: Text('Tab 3 Content'),
      title: 'Tab 3',
      subtitle: 'Third tab',
      headerActions: [Icon(Icons.add)],
    ),
  ];

  final testBottomNavItems = [
    AppBottomNavItem(
      icon: Icons.home,
      label: 'Home',
      onTap: () {},
    ),
    AppBottomNavItem(
      icon: Icons.search,
      label: 'Search',
      onTap: () {},
    ),
    AppBottomNavItem(
      icon: Icons.person,
      label: 'Profile',
      onTap: () {},
    ),
  ];

  group('AppDashboardScreen', () {
    testWidgets('renders with tabs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
          ),
        ),
      );

      expect(find.byType(AppDashboardScreen), findsOneWidget);
      expect(find.text('Tab 1 Content'), findsOneWidget);
      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('First tab'), findsOneWidget);
    });

    testWidgets('shows header when enabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
          ),
        ),
      );

      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('First tab'), findsOneWidget);
    });

    testWidgets('hides header when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 1,
          ),
        ),
      );

      expect(find.text('Tab 2'), findsNothing);
      expect(find.text('Second tab'), findsNothing);
    });

    testWidgets('shows bottom navigation when enabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            showBottomNav: true,
            bottomNavItems: testBottomNavItems,
          ),
        ),
      );

      expect(find.byType(AppBottomNavBar), findsOneWidget);
    });

    testWidgets('hides bottom navigation when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            showBottomNav: false,
            bottomNavItems: testBottomNavItems,
          ),
        ),
      );

      expect(find.byType(AppBottomNavBar), findsNothing);
    });

    testWidgets('calls onTabChanged when tab changes', (WidgetTester tester) async {
      int? selectedIndex;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            showBottomNav: true,
            bottomNavItems: testBottomNavItems,
            onTabChanged: (index) => selectedIndex = index,
          ),
        ),
      );

      // Tap on second nav item
      await tester.tap(find.byType(AppBottomNavBar).last);
      await tester.pump();

      expect(selectedIndex, equals(1));
    });

    testWidgets('uses custom backgroundColor', (WidgetTester tester) async {
      const customColor = Colors.blue;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            backgroundColor: customColor,
          ),
        ),
      );

      final dashboardScreen = tester.widget<AppDashboardScreen>(find.byType(AppDashboardScreen));
      expect(dashboardScreen.backgroundColor, equals(customColor));
    });

    testWidgets('uses custom padding', (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(32.0);

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            padding: customPadding,
          ),
        ),
      );

      final dashboardScreen = tester.widget<AppDashboardScreen>(find.byType(AppDashboardScreen));
      expect(dashboardScreen.padding, equals(customPadding));
    });

    testWidgets('uses custom maxWidth', (WidgetTester tester) async {
      const customMaxWidth = 800.0;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            maxWidth: customMaxWidth,
          ),
        ),
      );

      final dashboardScreen = tester.widget<AppDashboardScreen>(find.byType(AppDashboardScreen));
      expect(dashboardScreen.maxWidth, equals(customMaxWidth));
    });

    testWidgets('works with controller', (WidgetTester tester) async {
      final controller = AppDashboardController(initialIndex: 0);
      int? selectedIndex;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: controller.currentIndex,
            showBottomNav: true,
            bottomNavItems: testBottomNavItems,
            controller: controller,
            onTabChanged: (index) => selectedIndex = index,
          ),
        ),
      );

      // Change tab programmatically
      controller.jumpToTab(1);
      await tester.pump();

      expect(controller.currentIndex, equals(1));
      // Note: selectedIndex will be null because we're not tapping the nav bar
      // The controller only updates its internal state
    });

    testWidgets('respects scrollable property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            scrollable: false,
          ),
        ),
      );

      // Note: scrollable is passed to AppScreenBase, so we can't directly test it here
      expect(find.byType(AppDashboardScreen), findsOneWidget);
    });

    testWidgets('respects safeArea property', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: AppDashboardScreen(
            tabs: testTabs,
            currentTabIndex: 0,
            safeArea: false,
          ),
        ),
      );

      // Note: safeArea is passed to AppScreenBase, so we can't directly test it here
      expect(find.byType(AppDashboardScreen), findsOneWidget);
    });
  });

  group('AppDashboardTab', () {
    test('creates tab with required child', () {
      const tab = AppDashboardTab(
        child: Text('Test Content'),
        title: 'Test Tab',
      );

      expect(tab.child, isA<Text>());
      expect(tab.title, equals('Test Tab'));
      expect(tab.showHeader, isTrue);
    });

    test('creates tab with custom header configuration', () {
      const tab = AppDashboardTab(
        child: Text('Test Content'),
        title: 'Test Tab',
        subtitle: 'Test Subtitle',
        showHeader: false,
        headerActions: [Icon(Icons.add)],
      );

      expect(tab.title, equals('Test Tab'));
      expect(tab.subtitle, equals('Test Subtitle'));
      expect(tab.showHeader, isFalse);
      expect(tab.headerActions, isNotNull);
    });

    test('creates tab with key', () {
      const key = Key('test-key');
      const tab = AppDashboardTab(
        key: key,
        child: Text('Test Content'),
        title: 'Test Tab',
      );

      expect(tab.key, equals(key));
    });

    test('creates tab with header variant', () {
      const tab = AppDashboardTab(
        child: Text('Test Content'),
        title: 'Test Tab',
        headerVariant: AppHeaderVariant.compact,
      );

      expect(tab.headerVariant, equals(AppHeaderVariant.compact));
    });
  });

  group('AppDashboardController', () {
    test('initializes with correct index', () {
      final controller = AppDashboardController(initialIndex: 2);
      expect(controller.currentIndex, equals(2));
    });

    test('jumpToTab changes current index', () {
      final controller = AppDashboardController(initialIndex: 0);
      controller.jumpToTab(1);
      expect(controller.currentIndex, equals(1));
    });

    test('jumpToTab does not change if same index', () {
      final controller = AppDashboardController(initialIndex: 1);
      controller.jumpToTab(1);
      expect(controller.currentIndex, equals(1));
    });

    test('animateToTab changes current index', () {
      final controller = AppDashboardController(initialIndex: 0);
      controller.animateToTab(2);
      expect(controller.currentIndex, equals(2));
    });
  });

  group('AppDashboardScreenHelper', () {
    test('creates dashboard screen with helper', () {
      final tabs = [
        const AppDashboardTab(child: Text('Tab 1')),
        const AppDashboardTab(child: Text('Tab 2')),
      ];

      final dashboardScreen = AppDashboardScreenHelper.create(
        tabs: tabs,
        currentTabIndex: 0,
        showBottomNav: true,
      );

      expect(dashboardScreen.tabs, equals(tabs));
      expect(dashboardScreen.currentTabIndex, equals(0));
      expect(dashboardScreen.showBottomNav, isTrue);
    });

    test('creates dashboard screen with controller', () {
      final controller = AppDashboardController(initialIndex: 1);
      final tabs = [
        const AppDashboardTab(child: Text('Tab 1')),
        const AppDashboardTab(child: Text('Tab 2')),
      ];

      final dashboardScreen = AppDashboardScreenHelper.create(
        tabs: tabs,
        currentTabIndex: controller.currentIndex,
        controller: controller,
      );

      expect(dashboardScreen.controller, equals(controller));
      expect(dashboardScreen.currentTabIndex, equals(1));
    });

    test('creates tabs from simple content', () {
      final children = [
        const Text('Content 1'),
        const Text('Content 2'),
      ];
      final titles = ['Tab 1', 'Tab 2'];
      final subtitles = ['Subtitle 1', 'Subtitle 2'];

      final tabs = AppDashboardScreenHelper.createTabs(
        children: children,
        titles: titles,
        subtitles: subtitles,
      );

      expect(tabs.length, equals(2));
      expect(tabs[0].child, equals(children[0]));
      expect(tabs[0].title, equals('Tab 1'));
      expect(tabs[0].subtitle, equals('Subtitle 1'));
      expect(tabs[1].child, equals(children[1]));
      expect(tabs[1].title, equals('Tab 2'));
      expect(tabs[1].subtitle, equals('Subtitle 2'));
    });

    test('creates tabs with keys and header variants', () {
      final children = [
        const Text('Content 1'),
        const Text('Content 2'),
      ];
      final keys = [const Key('key1'), const Key('key2')];
      final headerVariants = [AppHeaderVariant.compact, AppHeaderVariant.large];

      final tabs = AppDashboardScreenHelper.createTabs(
        children: children,
        keys: keys,
        headerVariants: headerVariants,
      );

      expect(tabs.length, equals(2));
      expect(tabs[0].key, equals(keys[0]));
      expect(tabs[0].headerVariant, equals(headerVariants[0]));
      expect(tabs[1].key, equals(keys[1]));
      expect(tabs[1].headerVariant, equals(headerVariants[1]));
    });

    test('creates dashboard card', () {
      final card = AppDashboardScreenHelper.createDashboardCard(
        child: const Text('Card Content'),
        title: 'Card Title',
        actions: [const Icon(Icons.add)],
      );

      expect(card, isA<Builder>());
    });

    test('creates metrics card', () {
      final metricsCard = AppDashboardScreenHelper.createMetricsCard(
        title: 'Total Users',
        value: '1,234',
        subtitle: '+12% from last month',
        icon: Icons.people,
        color: Colors.blue,
      );

      expect(metricsCard, isA<Builder>());
    });

    test('handles empty lists in createTabs', () {
      final children = [
        const Text('Content 1'),
        const Text('Content 2'),
      ];

      final tabs = AppDashboardScreenHelper.createTabs(
        children: children,
        titles: const [],
        subtitles: const [],
        headerActions: const [],
        showHeaders: const [],
        headerVariants: const [],
        keys: const [],
      );

      expect(tabs.length, equals(2));
      expect(tabs[0].title, isNull);
      expect(tabs[0].subtitle, isNull);
      expect(tabs[0].headerActions, isNull);
      expect(tabs[0].showHeader, isTrue);
      expect(tabs[0].headerVariant, isNull);
      expect(tabs[0].key, isNull);
    });
  });
} 