import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coloring_app/main.dart';
import 'package:coloring_app/color_tile.dart';

void main() {
  group('BorderedText', () {
    testWidgets('creating without borders', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: BorderedText('T')));

      final textFinder = find.text('T');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('creating with borders', (WidgetTester tester) async {
      final size = 4.0;
      final color = Color(0);

      BorderedText borderedText = BorderedText(
        'T',
        borderSize: size,
        borderColor: color,
      );

      await tester.pumpWidget(MaterialApp(home: borderedText));

      final textFinder = find.text('T');
      expect(textFinder, findsNWidgets(2));

      expect(find.byWidget(borderedText), findsOneWidget);
    });
  });

  testWidgets('ColorTile', (WidgetTester tester) async {
    await tester.pumpWidget(ColorApp());

    final gestureDetectorFinder = find.byKey(Key('GestureDetector'));
    await tester.tap(gestureDetectorFinder);
    await tester.pump();

    final colorContainerFinder = find.byKey(Key('ColorContainer'));

    final colorContainer =
        tester.firstWidget(colorContainerFinder) as Container;
    expect(colorContainer.color, isA<Color>());
    expect(colorContainer.color.value, greaterThanOrEqualTo(0xff000000));

    await tester.tap(gestureDetectorFinder);
    await tester.pump();

    final newColorContainer =
        tester.firstWidget(colorContainerFinder) as Container;
    expect(newColorContainer.color, isA<Color>());
    expect(newColorContainer.color.value, greaterThanOrEqualTo(0xff000000));

    expect(colorContainer.color.value, isNot(newColorContainer.color.value));
  });
}
