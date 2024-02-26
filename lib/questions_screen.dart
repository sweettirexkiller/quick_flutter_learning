// import 
import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/answer_button.dart';
import 'package:flutter_application_tutorial_namer_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key, required this.onSelectedAnswer}) : super(key: key);

  final void Function(String) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  asnwerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(currentQuestion.question, textAlign: TextAlign.center, style: GoogleFonts.lato(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // map the answers
        
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return AnswerButton(answer,(){
              asnwerQuestion(answer);
            });
          }).toList(),
              
        ],),
      ),
    );
  }
}