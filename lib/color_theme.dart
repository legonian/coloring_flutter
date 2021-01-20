import 'dart:math';

import 'package:flutter/material.dart';

class ColorContext extends InheritedWidget {
  const ColorContext({
    Key key,
    @required this.color,
    @required Widget child,
  })  : assert(color != null),
        assert(child != null),
        super(key: key, child: child);

  final ColorGenerator color;

  static ColorContext of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorContext>();
  }

  @override
  bool updateShouldNotify(ColorContext old) =>
      color.background != old.color.background;
}

/// Class wrap describe app colors and related operations based on background.
class ColorGenerator {
  ColorGenerator([this.background = const Color(0xffffffff)]);

  /// Main color that represent all others.
  Color background;

  /// Return either dark or light color to contranst to background.
  Color get border {
    final luminance = background.computeLuminance();
    if (luminance < 0.5) {
      return Colors.grey[100];
    } else {
      return Colors.grey[900];
    }
  }

  /// Return fliped background color that used for text.
  Color get text => Color(0xffffffff - background.value).withAlpha(0xff);

  /// Generate random color and apply it to background variable.
  Color generateNew() {
    background = Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
    return background;
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
