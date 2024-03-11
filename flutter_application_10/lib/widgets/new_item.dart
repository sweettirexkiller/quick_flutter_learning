import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_10/data/categories.dart';

class NewItem extends StatefulWidget {
  // constructor
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
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
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
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
                    initialValue: '1',
                    validator: (value) => value!.isEmpty ? 'Please enter a quantity' : null,
                  ),
                ),
            
                const SizedBox(width: 10),
              
                Expanded(
                  child: DropdownButtonFormField(
                    onChanged: (value) {},
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
          ],),
          )
      ),
      );
  }
}