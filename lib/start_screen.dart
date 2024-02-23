import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  
  // additional parent constructor
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Image(image: AssetImage('assets/images/quiz-logo.png'), height: 200, width: 200),
         // space 
        SizedBox(height: 30),
         Text(
          'Let\'s start the quiz!', 
           style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
           ),

           OutlinedButton(
            onPressed: null, 
            child: Text('Start Quiz'),
            ),
        ],
      ),
    );
  }
}