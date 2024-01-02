import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.brown
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({this.selectedColor = 0, this.isDarkmode = false})
      : assert(selectedColor >= 0, 'selectedColor must be greather than 0.'),
        assert(selectedColor < colorList.length,
            'selectedColor must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: false),
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        useMaterial3: true,
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkmode: isDarkmode ?? this.isDarkmode);
}
