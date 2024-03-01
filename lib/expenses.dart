import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/chart/chart.dart';
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
    showModalBottomSheet(context: context,isScrollControlled: true, builder: 
      (bCtx) =>NewExpense(onAddExpense: _addExpense,)
    );
  }

  _addExpense(Expense newExpense){
    setState(() {
      _userExpences.add(newExpense);
    });
  }

  _removeExpense(String id){
    final expense = _userExpences.firstWhere((element) => element.id == id);
    final expenseIndex = _userExpences.indexWhere((element) => element.id == id);
    setState(() {
      _userExpences.removeWhere((element) => element.id == id);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 4),
      content: const Text('Expense removed'),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: (){
          setState(() {
            _userExpences.insert(expenseIndex, expense);
          });
        },
      ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    
     Widget mainContent = const Center(child: Text('No expenses added yet'),);
    if(_userExpences.isNotEmpty){
      mainContent = ExpencesList(expences: _userExpences,onRemoveExpense: _removeExpense,);
    }

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
          Chart(expenses: _userExpences),
          // the list of expences
          Expanded( child: mainContent )
        ],
      ),
    );
  }
}

