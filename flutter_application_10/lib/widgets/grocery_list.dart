import 'package:flutter/material.dart';
import 'package:flutter_application_10/models/grocery_item.dart';
import 'package:flutter_application_10/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  final List<GroceryItem> _groceryItems = [];


  void _addItem() async {
   final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (_) => const NewItem(),
      ),
    );
    if(newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
          )
        ]
      ),
      body: ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(_groceryItems[index].name),
            trailing: Text('${_groceryItems[index].quantity}x'),
            leading: Container(width:24,height: 24, color: _groceryItems[index].category.color),
          );
         },
      )
    );
  }
}