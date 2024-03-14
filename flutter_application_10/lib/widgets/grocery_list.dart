import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/categories.dart';
import 'package:flutter_application_10/models/grocery_item.dart';
import 'package:flutter_application_10/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  final List<GroceryItem> _groceryItems = [];


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    
    final result = await http.get(
      Uri.https('flutter-tutorial-622e7-default-rtdb.firebaseio.com', 'shopping-list.json'),
    );

    // map result.body to a list of grocery items
    // tmp list of grocery items
    final List<GroceryItem> loadedItems = [];

    if(result.body != 'null'){
      final data = json.decode(result.body) as Map<String,dynamic>;
      data.forEach((key, value) {
        loadedItems.add(GroceryItem(
          id: key,
          name: value['name'],
          quantity: value['quantity'],
          category: categories.entries.firstWhere((element) => element.value.title == value['category']).value,
        ));
      });
    }

    setState(() {
      _groceryItems.clear();
      _groceryItems.addAll(loadedItems);
    });

  }


  void _addItem() async {
   await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const NewItem(),
      ),
    );

    _loadData();
  }


  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items yet!'),);

    if(_groceryItems.isNotEmpty){
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index)  => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          onDismissed: (direction) {
            setState(() {
              _groceryItems.removeAt(index);
            });
          },
           child: ListTile(
            title: Text(_groceryItems[index].name),
            trailing: Text('${_groceryItems[index].quantity}x'),
            leading: Container(width:24,height: 24, color: _groceryItems[index].category.color),
          )
        )
         
      );
    }

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
      body:  content,
    );
  }
}