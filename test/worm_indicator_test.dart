import 'package:flutter_test/flutter_test.dart';

import 'package:worm_indicator/worm_indicator.dart';

void main() {
  test('Constructor params', () {
    expect(
        () => WormIndicator(
          length: 0,
        ),
        throwsAssertionError);
    expect(
        () => WormIndicator(
              length: 3,
              controller: null,
            ),
        throwsAssertionError);
  });
}
