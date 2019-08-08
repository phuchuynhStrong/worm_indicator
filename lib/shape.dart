import 'package:flutter/material.dart';

enum DotShape { Circle, Square, Rectangle }
const double invalidSize = -1.0;

class Shape {
  Shape(
      {this.width,
      this.height,
      this.size,
      this.spacing,
      @required this.shape}) {
    _throwAssertionErrorIfInvalidShape();
    _throwArgumentErrorIfMissingSizeArgumentForCircleOrSquareShape();
    _throwArgumentErrorIfMissingWidthOrHeightForRectangleShape();

    switch (this.shape) {
      case DotShape.Circle:
      case DotShape.Square:
        this.width = this.size;
        this.height = this.size;
        break;
      case DotShape.Rectangle:
        this.size = invalidSize;
        break;
      default:
    }
  }

  _throwAssertionErrorIfInvalidShape() {
    try {
      assert(shape != null);
    } on AssertionError catch (assertionError) {
      throw AssertionError(assertionError.message);
    }
  }

  _throwArgumentErrorIfMissingSizeArgumentForCircleOrSquareShape() {
    if (shape == DotShape.Circle || shape == DotShape.Square) {
      try {
        assert(size != null);
      } on AssertionError catch (_) {
        throw ArgumentError("No size found for ${shape.toString()}");
      }
    }
  }

  _throwArgumentErrorIfMissingWidthOrHeightForRectangleShape() {
    if (shape == DotShape.Rectangle) {
      try {
        assert(width != null);
        assert(height != null);
      } on AssertionError catch (_) {
        throw ArgumentError("No size found for ${shape.toString()}");
      }
    }
  }

  double width;
  double height;
  double size;
  final double spacing;
  final DotShape shape;

  static final defaultShape =
      Shape(size: 16.0, spacing: 8.0, shape: DotShape.Circle);
}
