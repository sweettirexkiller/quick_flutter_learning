import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/data/dummy_data.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_application_tutorial_namer_app/providers/favorites_provider.dart';
import 'package:flutter_application_tutorial_namer_app/providers/filters_provider.dart';
import 'package:flutter_application_tutorial_namer_app/providers/meals_provider.dart';
import 'package:flutter_application_tutorial_namer_app/screens/categories_screen.dart';
import 'package:flutter_application_tutorial_namer_app/screens/filters.dart';
import 'package:flutter_application_tutorial_namer_app/screens/meals_screen.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}
const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // Map<Filter, bool> _selectedFilters = ref.watch(filtersProvider);

    void _showInfoMessage(BuildContext context, String message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }

  //   void _toggleMealFavoritesStatus(Meal meal){
  //   final existingIndex = _favoriteMeals.indexWhere((element) => element.id == meal.id);
  //   if (existingIndex >= 0){
  //     setState(() {
  //       _favoriteMeals.removeAt(existingIndex);
  //     });
  //     _showInfoMessage(context, 'Removed from favorites');
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //     });
  //     _showInfoMessage(context, 'Added to favorites');
  //   }
  //   print(_favoriteMeals);
  // }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void setScreen(String identifier)async  {
     Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (_) {
        return FiltersScreen();
      }));

    
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final _selectedFilters = ref.watch(filtersProvider);
    final availableMeals = meals.where((meal){
          if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
            return false;
          }
          if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
            return false;
          }
          if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
            return false;
          }
          return true;
        }).toList();

    Widget activePage = CategoriesScreen(availableMeals: availableMeals,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle = 'Your Favorites';
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
          ),
        drawer: MainDrawer(onSelectedScreen: setScreen,),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: _selectedPageIndex,
          items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.set_meal),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                label: 'Favorites',
              ),
          ]
        ),
      ),
    );
  }
}
