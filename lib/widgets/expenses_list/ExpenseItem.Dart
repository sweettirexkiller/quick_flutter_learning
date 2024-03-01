// stateless widget

import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/Expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({Key? key, required this.expense}) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    expense.icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  
                  Text(
                    expense.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Text(
                expense.formattedDate,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }

  
}