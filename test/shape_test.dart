
import 'package:flutter_test/flutter_test.dart';
import 'package:worm_indicator/shape.dart';

void main() {
    group("Shape", () {
      test("Constructor: Must have a shape", () {
        expect(() => Shape(), throwsAssertionError);
        expect(() => Shape(shape: null), throwsAssertionError);
      });

      test("Constructor: Shape circular or square must have size", () {
        expect(() => Shape(shape: DotShape.Circle), throwsArgumentError);
        expect(() => Shape(shape: DotShape.Square), throwsArgumentError);
      });

      test("Constructor: Shape Rectangle must have width and height", () {
        expect(() => Shape(shape: DotShape.Rectangle,), throwsArgumentError);
      });

      test("Constructor: Circle or Square Shape must have width and height equal to size", () {
        var shape = Shape(shape: DotShape.Circle, size: 10);
        expect(shape.width, shape.size);
        expect(shape.height, shape.size);
        shape = Shape(shape: DotShape.Square, size: 10);
        expect(shape.width, shape.size);
        expect(shape.height, shape.size);
      });

      test("Constructor: Rectangle shape must have width and height as same as input and size is invalid", () {
        var shape = Shape(shape: DotShape.Rectangle, width: 10, height: 20);
        expect(shape.width, 10);
        expect(shape.height, 20);
        expect(shape.size, invalidSize);
      });
    });
}