import 'package:flutter/material.dart';

import 'options.dart';

class ColorTile extends StatefulWidget {
  @override
  ColorTileState createState() => ColorTileState();
}

class ColorTileState extends State<ColorTile> {
  @override
  void initState() {
    super.initState();
    options = Options(textData: 'Hey There', textSize: 80, borderSize: 5);
    loadData();
  }

  Options options;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: Key('GestureDetector'),
        onTap: () {
          setState(() {
            options.color.generateNew();
            saveData();
          });
        },
        child: Container(
            key: Key('ColorContainer'),
            color: options.color.background,
            child: Center(
                child: BorderedText(
              options.textData,
              style: TextStyle(
                  fontSize: options.textSize, color: options.color.text),
              borderSize: options.borderSize,
              borderColor: options.color.border,
            ))));
  }

  loadData() async {
    await options.loadData();
    setState(() {});
  }

  saveData() async {
    await options.saveData();
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
    this.borderColor = Colors.black,
    this.borderSize = 0,
  }) : assert(
          data != null,
          'A non-null String must be provided to a BorderedText widget.',
        );

  /// The text to display.
  final String data;

  /// If non-null, the style to use for this text.
  final TextStyle style;

  /// Used in strokeWidth in ``Paint`` foreground object and represent size of
  /// border.
  final double borderSize;

  /// Used in color in ``Paint`` foreground object and represent color of
  /// border.
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    if (this.borderSize == 0) {
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
                ..strokeWidth = borderSize
                ..color = borderColor,
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
