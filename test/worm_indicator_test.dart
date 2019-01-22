import 'package:flutter_test/flutter_test.dart';

import 'package:worm_indicator/worm_indicator.dart';

void main() {
  test('adds one to input values', () {
    expect(() => WormIndicator(
      dotsLength: 0,
    ), throwsRangeError);
    expect(() => WormIndicator(
      dotsLength: 3,
      onPageChange: null,
    ), throwsNullThrownError);
  });
}
