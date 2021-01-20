import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:coloring_app/color_theme.dart';

void main() {
  group('ColorGenerator class', () {
    test('defualt color', () {
      final defualtColor = Color(0xffffffff);

      final color = ColorGenerator();

      expect(color.background, isA<Color>());
      expect(color.border, isA<Color>());
      expect(color.text, isA<Color>());

      expect(color.background.value, defualtColor.value);

      color.generateNew();
    });

    test('border and text colors and randomize new', () {
      final someBlackishColor = Color(0x11111111);

      final color = ColorGenerator(someBlackishColor);

      expect(color.background, isA<Color>());
      expect(color.background.value, someBlackishColor.value);

      expect(color.border, isA<Color>());
      expect(color.border.value, Colors.grey[100].value);

      expect(color.text, isA<Color>());
      expect(color.text.value, 0xffeeeeee);

      color.generateNew();

      expect(color.background, isA<Color>());
      expect(color.background.alpha, 0xff);
      expect(color.background.value, isNot(someBlackishColor.value));
    });
  });

  group('CustomBorderStyle class', () {
    test('creating', () {
      final size = 10.0;
      final color = Color(0);

      CustomBorderStyle style = CustomBorderStyle(size: size, color: color);

      expect(style, isA<CustomBorderStyle>());

      expect(style.size, isA<double>());
      expect(style.size, size);

      expect(style.color, isA<Color>());
      expect(style.color, color);
    });
  });
}
