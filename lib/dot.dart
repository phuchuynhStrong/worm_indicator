import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DotInstance extends StatefulWidget {
  DotInstance({
    Key key,
    @required this.listenable,
    @required this.dotsLength,
    this.dotsSize = 16,
    this.dotsSpacing = 8,
    this.color = const Color(0xff35affc),
  }) : super(key: key);

  final PageController listenable;
  final int dotsSize;
  final int dotsSpacing;
  final int dotsLength;
  final Color color;
  @override
  State<StatefulWidget> createState() => DotInstanceState();
}

class DotInstanceState extends State<DotInstance>
    with SingleTickerProviderStateMixin {
  double _x = 0;
  SpringDescription spring =
  new SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0);
  SpringSimulation springSimulation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    widget.listenable.addListener(() {
      setState(() {
        _x = widget.listenable.page;
      });
    });
    animationController = new AnimationController(
      vsync: this,
      lowerBound: double.negativeInfinity,
      upperBound: double.infinity,
    );
  }

  double dotsSize(context, length) {
    double width = MediaQuery.of(context).size.width;
    var leftMargin =
        (width - length * widget.dotsSize - (length - 1) * widget.dotsSpacing) /
            2;
    return leftMargin + (widget.dotsSize + widget.dotsSpacing) * _x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: dotsSize(context, widget.dotsLength)),
      child: Container(
        width: widget.dotsSize.toDouble(),
        height: widget.dotsSize.toDouble(),
      ),
      decoration: BoxDecoration(
        color: widget.color ?? Color(0xff35affc),
        shape: BoxShape.circle,
      ),
    );
  }
}