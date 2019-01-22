library worm_indicator;

import 'package:flutter/material.dart';
import 'dot.dart';

class WormIndicator extends StatefulWidget {
  WormIndicator({
    Key key,
    @required this.dotsLength,
    this.dotsSpacing = 8,
    this.dotsSize = 16,
    this.onPageChange,
    this.dotsColor = const Color(0xff808080),
  }) : super(key: key);

  final int dotsLength;
  final dotsSize;
  final dotsSpacing;
  final int dotsStrokeWidth = 2;
  final int dotsCornerRadius = 8;
  final PageController onPageChange;
  final Color dotIndicatorColor = Colors.white;
  final Color dotsColor;
  final Color dotsStrokeColor = Color(0xff35affc);
  @override
  State<StatefulWidget> createState() => _DotsIndicatorState();
}

class _DotsIndicatorState extends State<WormIndicator> {
  Widget buildDot(color, index) {
    if ((widget.dotsLength % 2 == 1 && index == (widget.dotsLength ~/ 2)) ||
        index == -1) {
      return Container(
        child: Container(
          width: widget.dotsSize.toDouble(),
          height: widget.dotsSize.toDouble(),
        ),
        decoration: BoxDecoration(
          color: color ?? Color(0xff35affc),
          shape: BoxShape.circle,
        ),
      );
    }

    if (widget.dotsLength % 2 == 1 && index < (widget.dotsLength ~/ 2)) {
      return Container(
        margin: EdgeInsets.only(right: widget.dotsSpacing.toDouble()),
        child: Container(
          width: widget.dotsSize.toDouble(),
          height: widget.dotsSize.toDouble(),
        ),
        decoration: BoxDecoration(
          color: color ?? Color(0xff35affc),
          shape: BoxShape.circle,
        ),
      );
    }

    if (widget.dotsLength % 2 == 1 && index > (widget.dotsLength ~/ 2)) {
      return Container(
        margin: EdgeInsets.only(left: widget.dotsSpacing.toDouble()),
        child: Container(
          width: widget.dotsSize.toDouble(),
          height: widget.dotsSize.toDouble(),
        ),
        decoration: BoxDecoration(
          // color: Color(0xff35affc),
          color: color ?? Color(0xff35affc),
          shape: BoxShape.circle,
        ),
      );
    }

    if ((widget.dotsLength % 2 == 0 && index < (widget.dotsLength ~/ 2)) ||
        index == -1) {
      return Container(
        margin: EdgeInsets.only(right: widget.dotsSpacing.toDouble()),
        child: Container(
          width: widget.dotsSize.toDouble(),
          height: widget.dotsSize.toDouble(),
        ),
        decoration: BoxDecoration(
          color: color ?? Color(0xff35affc),
          shape: BoxShape.circle,
        ),
      );
    }

    if (widget.dotsLength % 2 == 0 && index > (widget.dotsLength ~/ 2)) {
      return Container(
        margin: EdgeInsets.only(left: widget.dotsSpacing.toDouble()),
        child: Container(
          width: widget.dotsSize.toDouble(),
          height: widget.dotsSize.toDouble(),
        ),
        decoration: BoxDecoration(
          color: color ?? Color(0xff35affc),
          shape: BoxShape.circle,
        ),
      );
    }

    return Container(
      child: Container(
        width: widget.dotsSize.toDouble(),
        height: widget.dotsSize.toDouble(),
      ),
      decoration: BoxDecoration(
        color: color ?? Color(0xff808080),
        shape: BoxShape.circle,
      ),
    );
  }

  List<Widget> _renderNormalDots() {
    var listDots = List<Widget>();
    for (int i = 0; i < widget.dotsLength; i++) {
      listDots.add(buildDot(widget.dotsColor ?? (0xff808080), i));
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
              dotsLength: widget.dotsLength,
              listenable: widget.onPageChange,
              dotsSize: widget.dotsSize,
              dotsSpacing: widget.dotsSpacing,
              color: Color(0xff35affc),
            ),
          ),
        ],
      ),
    );
  }
}

