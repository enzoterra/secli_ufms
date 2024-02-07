import 'package:flutter/material.dart';

final tema = ThemeData(
  /*textTheme: const TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 24),
  ),*/
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 60, 118, 226)), 
  iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)))
);
