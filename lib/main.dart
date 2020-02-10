import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(),
    );
  }
}

class CirclePainter extends CustomPainter{
  final _random = new Random();
  List <Color> _colors = [];

  CirclePainter(){
    for (int i = 0; i < 100; i ++){
      _colors.add(Colors.green
      .withRed(next(0,255))
          .withGreen(next(0,255))
          .withBlue(next(0,255)));
    }
  }

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  void paint(Canvas canvas,Size size){
  for (int i = 0; i <100; i++){
  var radius = (i * 10).toDouble();
  canvas.drawCircle(
      new Offset(1000.0, 1000.0),
      radius,
      new Paint()
  ..color = _colors[i]
  ..strokeCap = StrokeCap.round
  ..style = PaintingStyle.stroke
  ..strokeWidth = 15.0);
  }
  }


  @override
  bool shouldRepaint(CirclePainter oldDelegate){
  return false;
  }
}


class MyHomePage extends StatelessWidget {
  CirclePainter circlePainter = new CirclePainter();
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subcl

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text("Scroll"),
        ),
        body: new SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPaint(
              size: Size(2000.0, 2000.0),
              foregroundPainter: circlePainter,

            )));
  }
}
