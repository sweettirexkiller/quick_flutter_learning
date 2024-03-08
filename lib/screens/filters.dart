import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/providers/filters_provider.dart';
import 'package:flutter_application_tutorial_namer_app/screens/tabs.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),

      body: Center(
        child:  Column(
            children: [
              SwitchListTile(
                value: activeFilters[Filter.glutenFree]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                }, 
                title: Text('Gluten-free',
                  style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                subtitle: Text('Only include gluten-free meals',),
                activeColor: Theme.of(context).colorScheme.secondary,
                contentPadding: EdgeInsets.only(left:34, right: 22),
                ),
          
                SwitchListTile(
               value: activeFilters[Filter.lactoseFree]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
                }, 
                title: Text('Lactose-free',
                  style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                subtitle: Text('Only include lactose-free meals',),
                activeColor: Theme.of(context).colorScheme.secondary,
                contentPadding: EdgeInsets.only(left:34, right: 22),
                ),
                 SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
                }, 
                title: Text('Vegetarian',
                  style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  ),
                subtitle: Text('Only include vegetarian meals',),
                activeColor: Theme.of(context).colorScheme.secondary,
                contentPadding: EdgeInsets.only(left:34, right: 22),
                ),
                 SwitchListTile(
                 value: activeFilters[Filter.vegan]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
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