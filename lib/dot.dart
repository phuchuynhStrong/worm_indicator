import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'shape.dart';

const defaultActiveDotColor = Color(0xff35affc);

class DotInstance extends StatefulWidget {
  DotInstance({
    Key? key,
    this.listenable,
    required this.length,
    required this.shape,
    this.color = defaultActiveDotColor,
  }) : super(key: key);

  final PageController? listenable;
  final int length;
  final Color? color;
  final Shape shape;
  @override
  State<StatefulWidget> createState() => DotInstanceState();
}

class DotInstanceState extends State<DotInstance>
    with SingleTickerProviderStateMixin {
  double? _offset = 0;
  double _nextPageToAnimate = 0;
  double _page = 0;
  bool _isAnimating = false;
  final floorRange = 0.000001;
  SpringDescription spring = SpringDescription(
    mass: 1.0,
    stiffness: 100.0,
    damping: 10.0,
  );
  SpringSimulation? springSimulation;
  late AnimationController animationController;

  void setAnimatingEnable() {
    _isAnimating = true;
  }

  void setAnimatingDisabled() {
    _isAnimating = false;
  }

  void setUpWidgetListenable() {
    widget.listenable?.addListener(() {
      if (mounted && !_isAnimating) {
        setState(() {
          _offset = widget.listenable?.page;

          if (_offset! >= _page && _offset!.floor() >= _page.ceil() + 1) {
            _nextPageToAnimate = _offset!.floor().toDouble();
            setAnimatingEnable();
            animationController.forward();
            return;
          }

          if (_offset! <= _page && _offset! <= _page.ceil() - 1) {
            _nextPageToAnimate = _offset!.ceil().toDouble();
            setAnimatingEnable();
            animationController.forward();
            return;
          }
        });
      }
    });
  }

  void setUpAnimationController() {
    animationController = new AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 150,
      ),
    )
      ..addListener(() {
        setState(() {
          if (_nextPageToAnimate > _page) {
            _page = _nextPageToAnimate - 1 + animationController.value;
          }

          if (_nextPageToAnimate < _page) {
            _page = _nextPageToAnimate + 1 - animationController.value;
          }
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reset();
          setState(() {
            setAnimatingDisabled();
          });
        }
      });
  }

  @override
  void initState() {
    super.initState();
    setUpWidgetListenable();
    setUpAnimationController();
  }

  @override
  void dispose() { 
    animationController.dispose();
    super.dispose();
  }

  double getMargin(context, length) {
    double width = MediaQuery.of(context).size.width;
    var leftMargin = (width -
            length * widget.shape.width -
            (length - 1) * widget.shape.spacing) /
        2;
    if (_offset! >= _page) {
      return leftMargin + (widget.shape.width! + widget.shape.spacing!) * _page;
    }

    return leftMargin +
        (widget.shape.width! + widget.shape.spacing!) * _offset!;
  }

  BoxDecoration _getBoxDecoration(Shape dotShape) {
    switch (dotShape.shape) {
      case DotShape.Circle:
        return BoxDecoration(
          color: widget.color ?? defaultActiveDotColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            widget.shape.size! / 2,
          ),
        );
      case DotShape.Rectangle:
      case DotShape.Square:
        return BoxDecoration(
          color: widget.color ?? defaultActiveDotColor,
          shape: BoxShape.rectangle,
        );
      default:
        return BoxDecoration(
          color: widget.color ?? defaultActiveDotColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            widget.shape.width! / 2,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = (_offset! - _page).abs().toDouble();
    final calculatedWidth = width <= floorRange
        ? widget.shape.width
        : widget.shape.width! +
            (widget.shape.width! + widget.shape.spacing!) *
                (_offset! - _page).abs().toDouble();
    return Container(
      margin: EdgeInsets.only(
        left: getMargin(context, widget.length),
      ),
      child: Container(
        width: calculatedWidth,
        height: widget.shape.height,
      ),
      decoration: _getBoxDecoration(widget.shape),
    );
  }
}
