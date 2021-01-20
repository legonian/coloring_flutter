import 'package:flutter/material.dart';

import 'color_theme.dart';

class ColorTile extends StatefulWidget {
  @override
  ColorTileState createState() => ColorTileState();
}

class ColorTileState extends State<ColorTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: Key('GestureDetector'),
        onTap: () {
          setState(() {
            ColorContext.of(context).color.generateNew();
          });
        },
        child: Container(
            key: Key('ColorContainer'),
            color: ColorContext.of(context).color.background,
            child: Center(
                child: BorderedText(
              'Hey there',
              style: TextStyle(
                  fontSize: 60, color: ColorContext.of(context).color.text),
              border: CustomBorderStyle(
                size: 4,
                color: ColorContext.of(context).color.border,
              ),
            ))));
  }
}

class BorderedText extends StatelessWidget {
  /// Creates a text widget with borders.
  ///
  /// The [data] parameter must not be null.
  ///
  /// If the [border] argument is null, the text will be without borders.
  const BorderedText(
    this.data, {
    this.style = const TextStyle(fontSize: 60, color: Colors.white),
    this.border,
  }) : assert(
          data != null,
          'A non-null String must be provided to a BorderedText widget.',
        );

  /// The text to display.
  final String data;

  /// If non-null, the style to use for this text.
  final TextStyle style;

  /// If non-null, borders will be displayed around the text.
  final CustomBorderStyle border;

  @override
  Widget build(BuildContext context) {
    if (this.border == null) {
      return Text(
        data,
        style: style,
      );
    } else {
      return Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            data,
            style: TextStyle(
              fontSize: style.fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = border.size
                ..color = border.color,
            ),
          ),
          // Solid text as fill.
          Text(
            data,
            style: style,
          ),
        ],
      );
    }
  }
}
