import 'package:flutter/material.dart';

import 'color_tile.dart';

void main() {
  runApp(ColorApp());
}

class ColorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coloring Flutter',
      home: Scaffold(
        body: new ColorTile(),
      ),
    );
  }
}
