import 'dart:math';

import 'package:flutter/material.dart';

class Options {
  Options({
    @required this.textData,
    @required this.textSize,
    Color backgroundColor,
    this.borderSize = 0,
  }) {
    if (backgroundColor == null) {
      color = ColorGenerator();
    } else {
      color = ColorGenerator(backgroundColor);
    }
  }

  String textData;
  double textSize;
  ColorGenerator color;
  double borderSize;
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
