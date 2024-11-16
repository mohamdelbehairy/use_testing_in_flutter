import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Flutter driver test", () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    var textField = find.byType("TextField");
    var button = find.text("Click");
    var reverse = find.text("olleH");

    test("Test Widgets by flutter driver", () async {
      await driver!.tap(textField);
      await Future.delayed(const Duration(seconds: 2));
      await driver!.enterText("Hello");
      await Future.delayed(const Duration(seconds: 2));

      await driver!.waitForAbsent(reverse);
      await driver!.tap(button);

      await Future.delayed(const Duration(seconds: 2));

      await driver!.waitFor(reverse);
      await driver!.waitUntilNoTransientCallbacks();
      assert(reverse.toString().isNotEmpty);
    });
  });
}
