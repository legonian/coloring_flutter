import 'dart:math';

import 'package:flutter/material.dart';

class ColorTile extends StatefulWidget {
  @override
  ColorTileState createState() => ColorTileState();
}

class ColorTileState extends State<ColorTile> {
  /// Define color of background and text border (if presented).
  Color _color = CreateNewColor.favorite;

  @override
  Widget build(BuildContext context) {
    // Use [GestureDetector] to detect gestures.
    return GestureDetector(
        onTap: () {
          setState(() {
            _color = CreateNewColor.random();
          });
        },
        child: Container(
            color: _color,
            child: Center(
                child: BorderedText(
              'Hey there',
              border: CustomBorderStyle(
                size: 4,
                color: CreateNewColor.inverse(_color),
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
    // If border not presented return simple Text Widget.
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

/// Wrap parameters that define text border in ``BorderedText`` class.
class CustomBorderStyle {
  /// Creates a combination of border parameters.
  const CustomBorderStyle({
    @required this.size,
    @required this.color,
  });

  /// Used in strokeWidth in ``Paint`` foreground object and represent size of
  /// border.
  final double size;

  /// Used in color in ``Paint`` foreground object and represent color of
  /// border.
  final Color color;
}

/// Class wrap color related operations.
class CreateNewColor {
  /// Return my favorite color.
  static Color get favorite {
    return Colors.deepPurple.shade500;
  }

  /// Return some random color.
  static Color random() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }

  /// Return inverse color by substituting it from white.
  static Color inverse(Color origin) {
    return Color(0xffffffff - origin.value).withAlpha(0xff);
  }
}
