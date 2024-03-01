
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_tutorial_namer_app/expenses.dart';



void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark(),
    theme: ThemeData().copyWith(
        primaryColor: Colors.grey[800],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
        ),
        cardTheme: const CardTheme(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
             titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            )
        ),
        // darkTheme: ThemeData.dark(),
        colorScheme: ThemeData().colorScheme.copyWith(
          error: Colors.red,
        ),
      ),
    home: Expences()
    ));
}