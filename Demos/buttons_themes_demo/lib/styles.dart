import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white70,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontSize: 50,
      ),
      bodyMedium: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 20,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 10,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(20),
          side: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          textStyle: TextStyle(
            fontSize: 30,
          ),
        ),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey[500],
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    ),
  );
}