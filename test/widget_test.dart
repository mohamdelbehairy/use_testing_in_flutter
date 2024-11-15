import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/main.dart';

void main() {
  testWidgets('Check Widgets', (widgetTester) async {
    await widgetTester.pumpWidget(const HomeView()); // render ui (widgets)

    var textField = find.byType(TextField);
    expect(textField,
        findsOneWidget); // findsOneWidget  => بيتأكد ان التيكيست فيلد موجود في الويدجيت تري

    await widgetTester.enterText(textField, "Mohamed"); // input text
    expect(find.text("Mohamed"), findsOneWidget);

    var button = find.text('Click');
    expect(button, findsOneWidget);

    await widgetTester.tap(button); // click button
    await widgetTester.pump();

    expect(find.text("Mohamed"), findsOneWidget);
  });
}
