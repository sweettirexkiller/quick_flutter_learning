
// Stateful widget to add new expense
import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/Expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

// _NewExpenseState class

class _NewExpenseState extends State<NewExpense>{

  final _titleController = TextEditingController();
  late Category _category = Category.Leisure;
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
      const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),

          
            Row(children: [
              Expanded(child: 
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount', prefixText: '\$'),
                  controller: _amountController,
                ),
              ),
            
              const SizedBox(width: 10),

              // dropdown for category
              Expanded(child: 
                DropdownButton(
                  items: Category.values.map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.toString().split('.').last),
                  )).toList(),
                  onChanged: (Category? value){
                    // set state category
                    _category = value!;
                    print(_category);
                  },
                ),
              ),
              
              Expanded(child: 
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            ],),
         
          // input field for amount

          // space 
          const SizedBox(height: 10), 
          Row(children: [
            TextButton(onPressed: (){
                print('Cancel button pressed!');
                Navigator.pop(context);
              }, child: const Text('Cancel')),
            ElevatedButton(
              onPressed: (){
                // print the title
                Navigator.pop(context);
                print(
                  _titleController.text
                );
                // print the amount
                print(
                  _amountController.text
                );
                // create a new expense
                final newExpense = Expense(
                  title: _titleController.text,
                  amount: 0,
                  date: DateTime.now(),
                  category: Category.Leisure,
                );
            },
            child: const Text('Save Expense'),
          ),

          ],)
         
        ],
      ));
  }


}