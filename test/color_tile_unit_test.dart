import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:coloring_app/color_tile.dart';

void main() {
  group('CreateNewColor class', () {
    test('return favorite color', () {
      final deepPurple = Colors.deepPurple.shade500;
      final color = CreateNewColor.favorite;

      expect(color, isA<Color>());
      expect(color.value, deepPurple.value);
    });

    test('return inverse color', () {
      final origin = Color(0x11111111);
      final color = CreateNewColor.inverse(origin);

      expect(color, isA<Color>());
      expect(color.value, 0xffeeeeee);
    });

    test('return probably random color', () {
      final color = CreateNewColor.random();

      expect(color, isA<Color>());
      // random method define Alpha level as 0xFF
      expect(color.value, greaterThanOrEqualTo(0xff000000));

      final anotherColor = CreateNewColor.random();
      // can be equal rarely though
      expect(color.value, isNot(anotherColor.value));
    });
  });

  group('CustomBorderStyle class', () {
    test('is nullable', () {
      CustomBorderStyle style;

      expect(style, isNull);
    });

    test('creating', () {
      // Some random values.
      final size = 11.0;
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
