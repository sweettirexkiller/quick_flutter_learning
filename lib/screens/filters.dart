import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}


class _FiltersScreenState extends State<FiltersScreen>{
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Center(
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = !_glutenFreeFilterSet;
                });
              }, 
              title: Text('Gluten-free',
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                ),
              subtitle: Text('Only include gluten-free meals',),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
              ),



            
          ],
        ),
      ),
    );
  }

}