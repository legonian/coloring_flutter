import 'package:test/test.dart';
import 'package:flutter/material.dart';

import 'package:coloring_app/color_tile.dart';

void main() {
  group('CreateNewColor class', () {
    test('favorite color', () {
      final deepPurple = Colors.deepPurple.shade500;
      final color = CreateNewColor.favorite;

      expect(color, isA<Color>());
      expect(color.value, deepPurple.value);
    });

    test('inverse color', () {
      final origin = Color(0x11111111);
      final color = CreateNewColor.inverse(origin);

      expect(color, isA<Color>());
      expect(color.value, 0xffeeeeee);
    });

    test('random color', () {
      final color = CreateNewColor.random();

      expect(color, isA<Color>());
      expect(color.value, greaterThanOrEqualTo(0xff000000));
    });
  });
}
