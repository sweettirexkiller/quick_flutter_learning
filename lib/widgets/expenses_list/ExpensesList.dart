import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/Expense.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/expenses_list/ExpenseItem.Dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList({Key? key, required this.expences, required this.onRemoveExpense}) : super(key: key);

  final void Function(String) onRemoveExpense;


  final List<Expense> expences;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx,idx)=> Dismissible(
      background: Container(
        color: Theme.of(context).colorScheme.error.withOpacity(0.4),
        child: const Icon(Icons.delete, color: Colors.white, size: 40,),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
      key: ValueKey(expences[idx].id),
      onDismissed: (direction){ onRemoveExpense(expences[idx].id);},
      child:ExpenseItem(expense: expences[idx],)), itemCount: expences.length,);
  }
}