import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'color_tile.dart';

void main() {
  runApp(ColorApp());
}

class ColorApp extends StatelessWidget {
  // Root application widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coloring Flutter',
      home: Scaffold(
        body: AppColorTheme(color: ColorGenerator(), child: ColorTile()),
      ),
    );
  }
}
