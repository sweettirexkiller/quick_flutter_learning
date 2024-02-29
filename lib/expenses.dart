import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/expenses_list/ExpensesList.dart';
import 'package:flutter_application_tutorial_namer_app/models/Expense.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {

  final List<Expense> _userExpences = [
    Expense(
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
      category: Category.Leisure,
    ),
    Expense(
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
      category: Category.Food,
    ),
    Expense(
      title: 'Cinema',
      amount: 69.99,
      date: DateTime.now(),
      category: Category.Leisure,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('The Chart'),
          // the list of expences
          Expanded( child: ExpencesList(expences: _userExpences,))
        ],
      ),
    );
  }
}

