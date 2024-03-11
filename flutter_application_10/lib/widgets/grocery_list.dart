import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(groceryItems[index].name),
            trailing: Text('${groceryItems[index].quantity}x'),
            leading: Container(width:24,height: 24, color: groceryItems[index].category.color),
          );
         },
      )
    );
  }
}