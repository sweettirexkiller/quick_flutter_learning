import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  
  // additional parent constructor
  const StartScreen(this.startQuiz, {super.key});


  // get current state

  final void Function() startQuiz;
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Image(image: AssetImage('assets/images/quiz-logo.png'), height: 200, width: 200, color: const Color.fromARGB(150, 250, 250, 250)),
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
            // space
            // space
        SizedBox(height: 30),  
        OutlinedButton(
            onPressed: (){startQuiz();}, 
             style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: Center(child: Text('Start Quiz')),
        ),
        ],
      ),
    );
  }
}