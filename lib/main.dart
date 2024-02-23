// basic imports
import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/start_screen.dart';


// main function  
void main() {
  runApp(MyApp());
}

// MyApp class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.green],
            )
          ),
          child: const StartScreen()
          )

      ),
    );
  }
}
