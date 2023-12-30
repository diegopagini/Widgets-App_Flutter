import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'selectedColor must be greather than 0.'),
        assert(selectedColor < colorList.length - 1,
            'selectedColor must be less or equiat than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: false),
        colorSchemeSeed: colorList[selectedColor],
        useMaterial3: true,
      );
}
