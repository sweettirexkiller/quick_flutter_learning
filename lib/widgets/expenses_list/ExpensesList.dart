import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/Expense.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/expenses_list/ExpenseItem.Dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList({Key? key, required this.expences}) : super(key: key);


  final List<Expense> expences;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx,idx)=> ExpenseItem(expense: expences[idx],), itemCount: expences.length,);
  }
}