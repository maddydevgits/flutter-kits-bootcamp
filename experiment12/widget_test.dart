import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kits_experiment12_app/main.dart';

void main() {
  testWidgets("Counter increments when button is pressed", (
    WidgetTester tester,
  ) async {
    // Build the widget
    await tester.pumpWidget(MyApp());

    // Verify whether initial value of counter is 0 or not
    expect(find.text('0'), findsOneWidget);

    // Tap the button
    await tester.tap(find.byKey(Key("incrementButton")));
    await tester.pump(); // reload the screen

    // Verify the value is changed to 1 or not
    expect(find.text('1'), findsOneWidget);
  });
}
