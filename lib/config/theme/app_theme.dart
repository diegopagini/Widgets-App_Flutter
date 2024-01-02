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
  final bool isDarkmode;

  AppTheme({this.selectedColor = 0, this.isDarkmode = false})
      : assert(selectedColor >= 0, 'selectedColor must be greather than 0.'),
        assert(selectedColor < colorList.length,
            'selectedColor must be less or equiat than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: false),
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        useMaterial3: true,
      );
}
