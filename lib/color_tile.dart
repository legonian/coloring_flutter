import 'dart:math';

import 'package:flutter/material.dart';

class ColorTile extends StatefulWidget {
  @override
  ColorTileState createState() => ColorTileState();
}

class ColorTileState extends State<ColorTile> {
  Color color = CreateNewColor.favorite;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          setState(() {
            color = CreateNewColor.random();
          });
        },
        child: new Container(
            color: color,
            child: Center(
                child: BorderedText(
              'Hey there',
              border: new BorderStyle(
                color: CreateNewColor.inverse(color),
              ),
            ))));
  }
}

class BorderedText extends StatelessWidget {
  const BorderedText(
    this.data, {
    Key key,
    this.size = 60,
    this.color = Colors.white,
    @required this.border,
  }) : super(key: key);

  final BorderStyle border;

  final String data;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          data,
          style: TextStyle(
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = border.size
              ..color = border.color,
          ),
        ),
        // Solid text as fill.
        Text(
          data,
          style: TextStyle(
            fontSize: size,
            color: color,
          ),
        ),
      ],
    );
  }
}

class BorderStyle {
  const BorderStyle({
    this.size = 4,
    @required this.color,
  });

  final double size;
  final Color color;
}

class CreateNewColor {
  static Color get favorite {
    return Colors.deepPurple.shade500;
  }

  static Color random() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }

  static Color inverse(Color origin) {
    return Color(0xffffffff - origin.value).withAlpha(0xff);
  }
}
