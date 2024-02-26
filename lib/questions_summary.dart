import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class  QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({Key? key, required this.summaryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: summaryData.map((data) {
        return Row(children: [
          
          Expanded(
            child: Column(children: [
              Text('${((data['question_index'] as int) + 1).toString()}. ${data['question'] as String}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
               if (data['is_correct'] == true) ...[
              const Text('You are correct!', style: TextStyle(fontSize: 16, color: Colors.green)),
              ] else ...[
                const Text('You are wrong!', style: TextStyle(fontSize: 16, color: Colors.red)),
              ],
              Text('Correct answer: ${data['correct_answer']}', style: const TextStyle(fontSize: 16)),
              Text('Your answer: ${data['answer']}', style: const TextStyle(fontSize: 16)),
              
            ]),
          ),
          const SizedBox(width: 0),
        ],);
    }).toList());
  }
}