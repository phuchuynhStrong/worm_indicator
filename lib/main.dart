import 'package:flutter/material.dart';
import 'package:worm_indicator/worm_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyApp createState()=>_MyApp();
}

class _MyApp extends State<MyApp>{
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
    return MaterialApp(
      title: 'Worm indicator Example',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _controller,
              itemBuilder: (BuildContext context, int pos) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: Image.asset("lib/img${pos + 1}.jpg"),
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
      ),
    );
  }
}