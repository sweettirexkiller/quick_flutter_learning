import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_application_tutorial_namer_app/screens/categories_screen.dart';
import 'package:flutter_application_tutorial_namer_app/screens/meals_screen.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

    void _showInfoMessage(BuildContext context, String message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    void _toggleMealFavoritesStatus(Meal meal){
    final existingIndex = _favoriteMeals.indexWhere((element) => element.id == meal.id);
    if (existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
      _showInfoMessage(context, 'Removed from favorites');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage(context, 'Added to favorites');
    }
    print(_favoriteMeals);
  }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoritesStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: _favoriteMeals,onToggleFavorite: _toggleMealFavoritesStatus,);
      activePageTitle = 'Your Favorites';
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
          ),
        drawer: MainDrawer(),
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
