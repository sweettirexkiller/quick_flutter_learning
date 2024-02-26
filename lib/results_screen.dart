

import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/data/questions.dart';
import 'package:flutter_application_tutorial_namer_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key, required this.chooseAnswers, required this.onRestart}) : super(key: key);

  final void Function() onRestart;
  final List<String> chooseAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
   
    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i ,
        'question': questions[i].question,
        'answer': chooseAnswers[i],
        'correct_answer': questions[i].answers[0],
        'is_correct': questions[i].answers[0] == (chooseAnswers[i]),
      });
    }


    return summary;
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Results', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              // number of correct answers
              Text('You got ${summaryData.where((element) => element['is_correct'] == true).length} out of ${questions.length} questions right', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              QuestionsSummary(summaryData: summaryData),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: onRestart, child: Text('Restart Quiz'))
            ],
          )),
      ),
    );
  }

}