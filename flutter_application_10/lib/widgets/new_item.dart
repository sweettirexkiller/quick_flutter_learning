import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_10/data/categories.dart';
import 'package:flutter_application_10/models/category.dart';
import 'package:flutter_application_10/models/grocery_item.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  // constructor
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _saveItem() async {
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    _formKey.currentState!.save();
    _isSending = true;

    final result = await http.post(
      headers: {
        'Content-Type': 'application/json',
      },
      Uri.https('flutter-tutorial-622e7-default-rtdb.firebaseio.com', 'shopping-list.json'),
      body: json.encode({
        'name': _enteredName,
        'quantity': _enteredQuantity,
        'category': _selectedCategory.title,
      }),
    );

    final resData = json.decode(result.body);
   
    if(!context.mounted){
      return;
    }

    Navigator.of(context).pop(GroceryItem(id: resData['name'], name: _enteredName, quantity: _enteredQuantity, category: _selectedCategory));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: 
      // form
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if(value == null 
                  || value.isEmpty 
                  || value.trim().length <= 1 
                  || value.trim().length > 50){
                    return 'Must be between 1 and 50 characters long';
                  }
                  
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                    ),
                    initialValue: _enteredQuantity.toString(),
                   validator: (value) {
                  if(value == null 
                  || value.isEmpty 
                  || int.tryParse(value) == null
                  || int.tryParse(value)! <= 0){
                    return 'Must be a valid positive number';
                  }
                  
                  return null;
                },
                onSaved: (value){
                  _enteredQuantity = int.parse(value!);
                },
                  ),
                ),
            
                const SizedBox(width: 10),
              
                Expanded(
                  child: DropdownButtonFormField(
                    value: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value as Category;
                      });
                    },
                    items: [  
                      for(final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                              width: 16,
                              height: 16,
                              color: category.value.color,
                              ),
                              const SizedBox(width: 10), 
                              Text(category.value.title),
                            ] 
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: _isSending ? null : (){
                  _formKey.currentState!.reset();
                }, child: const Text('Reset')),
                ElevatedButton(onPressed: _isSending ? null : _saveItem, child: _isSending ? 
                const SizedBox(width: 16,height: 16,child: CircularProgressIndicator()):const Text('Add Item')),
              ],
            )
          ],),
          )
      ),
      );
  }
}