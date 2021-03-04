library worm_indicator;

import 'package:flutter/material.dart';

import 'dot.dart';
import 'shape.dart';

const defaultNormalDotColor = Color(0xff808080);

class WormIndicator extends StatelessWidget {
  final int length;
  final PageController? controller;
  final Color? color;
  final Color? indicatorColor;
  final Shape? shape;

  const WormIndicator({
    Key? key,
    required this.length,
    this.controller,
    this.color,
    this.indicatorColor,
    this.shape,
  })  : assert(length > 0),
        super(key: key);

  Container getNormalDotChildContainer() {
    switch (this.shape!.shape) {
      case DotShape.Circle:
        return Container(
          width: this.shape!.size,
          height: this.shape!.size,
        );
      default:
        return Container(
          width: this.shape!.width,
          height: this.shape!.height,
        );
    }
  }

  BoxDecoration getNormalDotDecoration(Color? color) {
    switch (this.shape!.shape) {
      case DotShape.Circle:
        return BoxDecoration(
          color: color ?? Color(0xff35affc),
          shape: BoxShape.circle,
        );
      case DotShape.Square:
      case DotShape.Rectangle:
        return BoxDecoration(
          color: color ?? Color(0xff35affc),
          shape: BoxShape.rectangle,
        );
      default:
        return BoxDecoration(
          color: color ?? Color(0xff35affc),
          shape: BoxShape.circle,
        );
    }
  }

  Widget buildDot(Color? color, index) {
    if ((this.length % 2 == 1 && index == (this.length ~/ 2)) || index == -1) {
      return Container(
        child: getNormalDotChildContainer(),
        decoration: getNormalDotDecoration(color),
      );
    }

    if (this.length % 2 == 1 && index < (this.length ~/ 2)) {
      return Container(
        margin: EdgeInsets.only(right: this.shape!.spacing!),
        child: getNormalDotChildContainer(),
        decoration: getNormalDotDecoration(color),
      );
    }

    if (this.length % 2 == 1 && index > (this.length ~/ 2)) {
      return Container(
        margin: EdgeInsets.only(left: this.shape!.spacing!),
        child: getNormalDotChildContainer(),
        decoration: getNormalDotDecoration(color),
      );
    }

    if ((this.length % 2 == 0 && index < (this.length ~/ 2)) || index == -1) {
      return Container(
        margin: EdgeInsets.only(right: this.shape!.spacing!),
        child: getNormalDotChildContainer(),
        decoration: getNormalDotDecoration(color),
      );
    }

    if (this.length % 2 == 0 && index > (this.length ~/ 2)) {
      return Container(
        margin: EdgeInsets.only(left: this.shape!.spacing!),
        child: getNormalDotChildContainer(),
        decoration: getNormalDotDecoration(color),
      );
    }

    return Container(
      child: getNormalDotChildContainer(),
      decoration: getNormalDotDecoration(color),
    );
  }

  List<Widget> _renderNormalDots() {
    var listDots = <Widget>[];
    for (int i = 0; i < this.length; i++) {
      listDots.add(buildDot(this.color ?? defaultNormalDotColor, i));
    }
    return listDots;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _renderNormalDots(),
            ),
          ),
          Container(
            child: DotInstance(
              length: this.length,
              listenable: this.controller,
              shape: this.shape!,
              color: this.indicatorColor,
            ),
          ),
        ],
      ),
    );
  }
}
