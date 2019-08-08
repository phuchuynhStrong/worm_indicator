import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'shape.dart';

class DotInstance extends StatefulWidget {
  DotInstance({
    Key key,
    @required this.listenable,
    @required this.length,
    this.shape,
    this.color = const Color(0xff35affc),
  }) : super(key: key);

  final PageController listenable;
  final int length;
  final Color color;
  final Shape shape;
  @override
  State<StatefulWidget> createState() => DotInstanceState();
}

class DotInstanceState extends State<DotInstance>
    with SingleTickerProviderStateMixin {
  double _offset = 0;
  double _page = 0;
  final ceilRange = 0.999999;
  final floorRange = 0.0001;
  SpringDescription spring = SpringDescription(
    mass: 1.0,
    stiffness: 100.0,
    damping: 10.0,
  );
  SpringSimulation springSimulation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(() {
      setState(() {
        _offset = widget.listenable.page;
        if ((_offset - _page).abs().toDouble() >= ceilRange) {
          _page = _offset;
        }
      });
    });

    animationController = new AnimationController(
      vsync: this,
      lowerBound: double.negativeInfinity,
      upperBound: double.infinity,
    );
  }

  double getMargin(context, length) {
    double width = MediaQuery.of(context).size.width;
    var leftMargin = (width -
            length * widget.shape.width -
            (length - 1) * widget.shape.spacing) /
        2;
    if (_offset >= _page) {
      return leftMargin + (widget.shape.width + widget.shape.spacing) * _page;
    } else {
      return leftMargin + (widget.shape.width + widget.shape.spacing) * _offset;
    }
  }

  BoxDecoration _getBoxDecoration(Shape dotShape) {
    switch (dotShape.shape) {
      case DotShape.Circle:
        return BoxDecoration(
          color: widget.color ?? Color(0xff35affc),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            widget.shape.size / 2,
          ),
        );
      case DotShape.Rectangle:
      case DotShape.Square:
        return BoxDecoration(
          color: widget.color ?? Color(0xff35affc),
          shape: BoxShape.rectangle,
        );
      default:
        return BoxDecoration(
          color: widget.color ?? Color(0xff35affc),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(widget.shape.width / 2),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = (_offset - _page).abs().toDouble();
    return Container(
      margin: EdgeInsets.only(left: getMargin(context, widget.length)),
      child: Container(
        width: width <= floorRange
            ? widget.shape.width
            : widget.shape.width +
                (widget.shape.width + widget.shape.spacing) *
                    (_offset - _page).abs().toDouble(),
        height: widget.shape.height,
      ),
      decoration: _getBoxDecoration(widget.shape),
    );
  }
}
