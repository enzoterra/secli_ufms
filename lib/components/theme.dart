import 'package:Secli/components/colors.dart';
import 'package:flutter/material.dart';

final tema = ThemeData(
  /*textTheme: const TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 24),
  ),*/
  colorScheme: ColorScheme.fromSeed(seedColor: CustomColors().blueMain), 
  iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(CustomColors().white)))
);
