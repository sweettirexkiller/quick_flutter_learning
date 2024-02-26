import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final void Function() selectHandler;

  const AnswerButton(this.answer, this.selectHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        
          onPressed: selectHandler,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(245, 23, 200, 132),  
            minimumSize: const Size(200, 50),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            
          ),
          child: Text(answer),
        ),
    );
  }
}