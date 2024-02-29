import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/expenses_list/ExpensesList.dart';
import 'package:flutter_application_tutorial_namer_app/models/Expense.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/new_expense.dart';

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

  _openNewExpenseForm() {
    //...
    showModalBottomSheet(context: context, builder: 
      (bCtx) =>NewExpense()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Personal Expences'),
        actions: [
          IconButton(
            onPressed: _openNewExpenseForm,
            icon: const Icon(Icons.add),
          )
        
        ],
      ),
      body: Column(
        children: [
          // the list of expences
          Expanded( child: ExpencesList(expences: _userExpences,))
        ],
      ),
    );
  }
}

