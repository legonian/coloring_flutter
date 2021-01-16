import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coloring_app/color_tile.dart';

void main() {
  group('BorderedText Widget', () {
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
        border: CustomBorderStyle(
          size: size,
          color: color,
        ),
      );

      await tester.pumpWidget(MaterialApp(home: borderedText));

      final textFinder = find.text('T');
      expect(textFinder, findsNWidgets(2));

      expect(find.byWidget(borderedText), findsOneWidget);
    });
  });

  testWidgets('ColorTile', (WidgetTester tester) async {
    // Create Windget.
    await tester.pumpWidget(MaterialApp(home: ColorTile()));

    // Tap at GestureDetector and update Widget.
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Save finded Container and check its color
    final firstContainer =
        tester.firstWidget(find.byType(Container)) as Container;
    expect(firstContainer.color, isA<Color>());
    expect(firstContainer.color.value, greaterThanOrEqualTo(0xff000000));

    // Tap at GestureDetector again
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Save finded Container and check its color
    final secondContainer =
        tester.firstWidget(find.byType(Container)) as Container;
    expect(secondContainer.color, isA<Color>());
    expect(secondContainer.color.value, greaterThanOrEqualTo(0xff000000));

    // Compare colors
    expect(firstContainer.color.value, isNot(secondContainer.color.value));
  });
}
