import 'package:flutter/material.dart';
import 'package:worm_indicator/shape.dart';
import 'package:worm_indicator/worm_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worm Indicator Example',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  Widget buildPageView() {
    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _controller,
      itemBuilder: (BuildContext context, int pos) {
        return Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Worm Indicator - Page $pos",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              )
            ],
          ),
        );
      },
      itemCount: 3,
    );
  }

  Widget buildExampleIndicatorWithShapeAndBottomPos(
      Shape shape, double bottomPos) {
    return Positioned(
      bottom: bottomPos,
      left: 0,
      right: 0,
      child: WormIndicator(
        length: 3,
        controller: _controller,
        shape: shape,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final circleShape = Shape(
      size: 16,
      shape: DotShape.Circle,
      spacing: 8,
    );
    final squareShape = Shape(
      size: 16,
      shape: DotShape.Square,
      spacing: 8,
    );
    final rectangleShape = Shape(
      width: 16,
      height: 24,
      shape: DotShape.Rectangle,
      spacing: 8,
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildPageView(),
          buildExampleIndicatorWithShapeAndBottomPos(circleShape, 20),
          buildExampleIndicatorWithShapeAndBottomPos(squareShape, 56),
          buildExampleIndicatorWithShapeAndBottomPos(rectangleShape, 100),
        ],
      ),
    );
  }
}
