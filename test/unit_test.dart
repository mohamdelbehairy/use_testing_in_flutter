import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/main.dart';

void main() {
  test('Reversed Text', () {
    expect(reverseText('Mohamed'), 'demahoM');
  });

  test('Length Text', () {
    expect(lengthText('Mohamed'), 7);
  });
}
