import 'package:flutter/material.dart';
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
  PageController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _controller,
            itemBuilder: (BuildContext context, int pos) {
              return Container(
                margin: EdgeInsets.all(20),
                child: Image.asset("lib/wall-${pos + 1}.jpg"),
              );
            },
            itemCount: 3,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: WormIndicator(
              length: 3,
              controller: _controller,
              size: 16,
              spacing: 8,
            ),
          ),
        ],
      ),
    );
  }
}