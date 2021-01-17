import 'dart:math';

import 'package:flutter/material.dart';

class ColorTile extends StatefulWidget {
  @override
  ColorTileState createState() => ColorTileState();
}

class ColorTileState extends State<ColorTile> {
  var color = ColorGenerator();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: Key('GestureDetector'),
        onTap: () {
          setState(() {
            color.generateNew();
          });
        },
        child: Container(
            key: Key('ColorContainer'),
            color: color.background,
            child: Center(
                child: BorderedText(
              'Hey there',
              style: TextStyle(fontSize: 60, color: color.text),
              border: CustomBorderStyle(
                size: 4,
                color: color.border,
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

/// Class wrap describe app colors and related operations based on background.
class ColorGenerator {
  ColorGenerator([this.background = const Color(0xffffffff)]);

  /// Main color that represent all others
  Color background;

  /// Return either dark or light color to contranst to background
  Color get border {
    final luminance = background.computeLuminance();
    if (luminance < 0.5) {
      return Colors.grey[100];
    } else {
      return Colors.grey[900];
    }
  }

  /// Return fliped background color that used for text
  Color get text {
    return Color(0xffffffff - background.value).withAlpha(0xff);
  }

  /// Generate random color and apply it to background
  Color generateNew() {
    background = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
    return background;
  }
}
