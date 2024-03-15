import 'dart:async';
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
  late Future<List<GroceryItem>> _loadedItems;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadData();
  }

  Future<List<GroceryItem>> _loadData() async {
    final List<GroceryItem> loadedItems = [];
    
    final result = await http.get(
      Uri.https('flutter-tutorial-622e7-default-rtdb.firebaseio.com', 'shopping-list.json'),
    );

    print(result.statusCode);
    if(result.statusCode >= 400){
      throw Exception('Failed to load groceries');
    }



    // map result.body to a list of grocery items
    // tmp list of grocery items
  

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
    } else {
      return [];
    }

    return loadedItems;
  }


  void _addItem() async {
   final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const NewItem(),
      ),
    );

    if(newItem != null){
      setState(() {
        _groceryItems.add(newItem as GroceryItem);
      });
    }
  }


  void removeItem(GroceryItem item) async {

    final index = _groceryItems.indexOf(item);

     setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https('flutter-tutorial-622e7-default-rtdb.firebaseio.com', 'shopping-list/${item.id}.json');

    final res = await http.delete(url);
    
    if(res.statusCode >= 400){
      print('Error deleting item: ${res.statusCode}');
      setState(() {
        _groceryItems.insert(index, item);
      });
      return;
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
      body:  FutureBuilder(
        future: _loadedItems,
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.hasError){
            return Center(child: Text('An error occurred: ${snapshot.error.toString()}'),);
          }

          if(snapshot.data!.isEmpty){
            return const Center(child: Text('No items yet!'),);
          }
          return  ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (ctx, index)  => Dismissible(
                      key: ValueKey(snapshot.data![index].id),
                      onDismissed: (direction) {
                        removeItem(snapshot.data![index]);
                      },
                      child: ListTile(
                        title: Text(snapshot.data![index].name),
                        trailing: Text('${snapshot.data![index].quantity}x'),
                        leading: Container(width:24,height: 24, color: snapshot.data![index].category.color),
                      )
                    )
         
                  );
        },
      )
    );
  }
}