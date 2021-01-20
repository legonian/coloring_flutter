import 'package:coloring_app/options.dart';
import 'package:flutter/material.dart';

import 'color_tile.dart';
import 'options.dart';

void main() {
  runApp(ColorApp());
}

class ColorApp extends StatelessWidget {
  static final options =
      Options(textData: 'Hey There', textSize: 80, borderSize: 5);
  // Root application widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coloring Flutter',
      home: Scaffold(
        body: ColorTile(),
      ),
    );
  }
}
