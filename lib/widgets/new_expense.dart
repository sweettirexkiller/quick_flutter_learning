
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
  // date
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }


  _submitData(){
    final enteredTitle = _titleController.text.trim();
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    print('enteredTitle: $enteredTitle');
    if(enteredTitle.isEmpty || amountIsInvalid || _selectedDate == null){
      print("error");
      showDialog(context: context, builder: (ctx){
        return AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter a valid title, amount and date'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text('Okay'))
          ],
        );
      });

      return;
    }

    final newExpense = Expense(
                  title: _titleController.text,
                  amount: amountIsInvalid ? 0 : enteredAmount,
                  date: _selectedDate ?? DateTime.now(),
                  category: _category,
                );

    print(newExpense);
    // widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    // close the bottom sheet
    Navigator.of(context).pop();
  }


  _presentDatePicker(){
  
      showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(2021), 
        lastDate: DateTime.now()
      ).then((pickedDate){
        if(pickedDate == null){
          return;
        }

        setState(() {
          _selectedDate = pickedDate;
        });
      });

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
              
            Expanded(child: 
              Column(
                children: [
                  Text(_selectedDate == null ? 'No Date Chosen!' : 'Picked Date: ${formatter.format(_selectedDate!)}'),
                  
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_today),
                  ),
              ])),
            
            ],),
         
          // input field for amount

          Row(
            children: [
              const Text('Category'),
              const SizedBox(width: 50),
              DropdownButton<Category>(
                value: _category,
                onChanged: (Category? newValue){
                  if(newValue != null){
                    setState(() {
                      _category = newValue;
                    });
                  }
                },
                items: Category.values.map((Category category){
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.toString().split('.').last),
                  );
                }).toList(),
              ),
            ],
          ),

          // space 
          const SizedBox(height: 10), 
          Row(children: [
            TextButton(onPressed: (){
                print('Cancel button pressed!');
                Navigator.pop(context);
              }, child: const Text('Cancel')),
            ElevatedButton(
              onPressed: _submitData,
            child: const Text('Save Expense'),
          ),

          ],)
         
        ],
      ));
  }


}