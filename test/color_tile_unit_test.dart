import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:coloring_app/options.dart';

void main() {
  group('ColorGenerator class', () {
    final someBlackishColor = Color(0x11111111);

    final color = ColorGenerator(someBlackishColor);

    test('validate colors', () {
      expect(color.background, isA<Color>());
      expect(color.background.value, someBlackishColor.value);

      expect(color.border, isA<Color>());
      expect(color.border.value, Colors.grey[100].value);

      expect(color.text, isA<Color>());
      expect(color.text.value, 0xffeeeeee);
    });

    test('randomizer', () {
      color.generateNew();

      expect(color.background, isA<Color>());
      expect(color.background.alpha, 0xff);
      expect(color.background.value, isNot(someBlackishColor.value));
    });
  });

  group('Options class', () {
    final blackColor = Color(0xff000000);
    final someBlackishColor = Color(0xff111111);
    Options options =
        Options(textData: 'Text', textSize: 10, backgroundColor: blackColor);

    test('validate colors', () {
      expect(options.color.background, blackColor);
      expect(options.color.text, isA<Color>());
      expect(options.color.border, isA<Color>());
    });

    test('save to storage', () async {
      expect(options.color.background, blackColor);
      options.color.background = someBlackishColor;
      expect(options.color.background, someBlackishColor);
      await options.saveData();
    });

    Options newOptions =
        Options(textData: 'Text', textSize: 10, backgroundColor: blackColor);

    test('load from storage', () async {
      await newOptions.loadData();
      expect(newOptions.color.background, someBlackishColor);
    });
  });
}
