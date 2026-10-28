import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:focusflow/main.dart';

void main() {
  testWidgets('FocusFlow app shell and navigation test', (WidgetTester tester) async {
    // Set realistic mobile phone viewport
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Build FocusFlow and trigger a frame.
    await tester.pumpWidget(const FocusFlowApp());
    await tester.pumpAndSettle();

    // Verify that the Dashboard welcome header is visible
    expect(find.textContaining('Alex'), findsOneWidget);

    // Verify that the 5 navigation destinations exist
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Tasks'), findsOneWidget);
    expect(find.text('Focus'), findsOneWidget);
    expect(find.text('Statistics'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    // Verify key dashboard widgets
    expect(find.text('Daily Study Goal'), findsOneWidget);
    expect(find.text('Start Focus Session'), findsOneWidget);
    expect(find.text("Today's Tasks", skipOffstage: false), findsOneWidget);

    // Test tab navigation to Tasks
    await tester.tap(find.byIcon(Icons.checklist_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Study Tasks'), findsOneWidget);

    // Test tab navigation to Focus Timer
    await tester.tap(find.byIcon(Icons.timer_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Focus Timer'), findsOneWidget);
    expect(find.text('25:00'), findsOneWidget);

    // Test tab navigation to Statistics
    await tester.tap(find.byIcon(Icons.bar_chart_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Study Analytics'), findsOneWidget);

    // Test tab navigation to Settings
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Settings & Preferences'), findsOneWidget);

    // Return to Home tab
    await tester.tap(find.byIcon(Icons.dashboard_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Daily Study Goal'), findsOneWidget);
  });
}
