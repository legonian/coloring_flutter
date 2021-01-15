import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coloring Flutter',
      home: Scaffold(
        body: new ColorTile(),
      ),
    );
  }
}

class ColorTile extends StatefulWidget {
  @override
  ColorTileState createState() => ColorTileState();
}

class ColorTileState extends State<ColorTile> {
  var color = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          print("GestureDetector clicked");
          setState(() {
            color = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
          });
        },
        child: new Container(
            color: color,
            child: Center(
              child: Text('Hey there'),
            )));
  }
}
