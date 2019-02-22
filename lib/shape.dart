enum DotShape { Circle, Square, Rectangle }

class Shape {
  Shape({this.width, this.height, this.spacing, this.shape});

  final double width;
  final double height;
  final double spacing;
  final DotShape shape;

  static final defaultShape = Shape(width: 16.0,height: 16.0,spacing: 8.0,shape: DotShape.Circle);
}
