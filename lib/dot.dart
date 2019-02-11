import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DotInstance extends StatefulWidget {
  DotInstance({
    Key key,
    @required this.listenable,
    @required this.length,
    this.size = 16,
    this.spacing = 8,
    this.color = const Color(0xff35affc),
  }) : super(key: key);

  final PageController listenable;
  final int size;
  final int spacing;
  final int length;
  final Color color;
  @override
  State<StatefulWidget> createState() => DotInstanceState();
}

class DotInstanceState extends State<DotInstance>
    with SingleTickerProviderStateMixin {
  double _offset = 0;
  double _page = 0;
  final ceilRange = 0.999999;
  final floorRange = 0.0001;
  SpringDescription spring = SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0);
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
    var leftMargin = (width - length * widget.size - (length - 1) * widget.spacing) / 2;
    if (_offset >= _page) {
      return leftMargin + (widget.size + widget.spacing) * _page;
    }
    else {
      return leftMargin + (widget.size + widget.spacing) * _offset;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = (_offset - _page).abs().toDouble();
    return Container(
      margin: EdgeInsets.only(left: getMargin(context, widget.length)),
      child: Container(
        width: width <= floorRange ? widget.size.toDouble() :
        widget.size + (widget.size + widget.spacing) * (_offset - _page).abs().toDouble(),
        height: widget.size.toDouble(),
      ),
      decoration: BoxDecoration(
        color: widget.color ?? Color(0xff35affc),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(widget.size / 2),
      ),
    );
  }
}