import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/screens/tabs.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}


class _FiltersScreenState extends State<FiltersScreen>{
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectedScreen: (String identifier) {  
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals') {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      //       return const TabsScreen();
      //     }));
      //   }
      // },),
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

              SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = !_lactoseFreeFilterSet;
                });
              }, 
              title: Text('Lactose-free',
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                ),
              subtitle: Text('Only include lactose-free meals',),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
              ),
               SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = !_vegetarianFilterSet;
                });
              }, 
              title: Text('Vegetarian',
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                ),
              subtitle: Text('Only include vegetarian meals',),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
              ),
               SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = !_veganFilterSet;
                });
              }, 
              title: Text('Vegan',
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                ),
              subtitle: Text('Only include vegan meals',),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: EdgeInsets.only(left:34, right: 22),
              ),






            
          ],
        ),
      ),
    );
  }

}