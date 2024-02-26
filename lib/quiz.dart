// statefull widget
// Quiz widget

import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/data/questions.dart';
import 'package:flutter_application_tutorial_namer_app/questions_screen.dart';
import 'package:flutter_application_tutorial_namer_app/results_screen.dart';
import 'package:flutter_application_tutorial_namer_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';
  Widget getScreen() {
    if(activeScreen == 'start-screen') {
      return StartScreen(switchScreen);
    } else if(activeScreen == 'questions-screen') {
      return QuestionsScreen(onSelectedAnswer: chooseAnswer);
    } else if(activeScreen == 'results-screen') {
      return ResultsScreen();
    } else {
      return const Text('Unknown screen');
    }
  }

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
   selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });

    }
  }


  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.green],
            )
          ),
          child: getScreen()
            
      ),
    );
  }
}