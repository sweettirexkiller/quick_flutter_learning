
import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/data/dummy_data.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_application_tutorial_namer_app/screens/meals_screen.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/category_grid_item.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key, required this.onToggleFavorite}) : super(key: key);
  
  final void Function(Meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(title: category.title, meals: filteredMeals, onToggleFavorite: onToggleFavorite);
        },
      ),
    );
  } 

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          // get categoris from dummy data
          for(final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory:(){
               _selectCategory(context, category);
            },),
        ],  
      );
  }
}