import 'package:flutter/material.dart';

final primaryColor = Colors.blueAccent[700];
const secondaryColor = Color.fromARGB(255, 73, 94, 140);

ThemeData theme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: secondaryColor,
  ),
  scaffoldBackgroundColor: Colors.white, 
  appBarTheme: const AppBarTheme(
    backgroundColor: secondaryColor,
  )
);