import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_application_tutorial_namer_app/screens/meal_details_screen.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({Key? key, this.title, required this.meals, required this.onToggleFavorite}) : super(key: key);

  final String? title;
  final void Function(Meal) onToggleFavorite;
  final List<Meal> meals;

  void selectMeal(BuildContext ctx, Meal meal) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal, onToggleFavorite: onToggleFavorite)));
  }

  Widget get content {

    if (meals.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning, size: 50),
            SizedBox(height: 10),
            Text('No meals found for this category'),
          ],
      ));
    }

    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(meal: meals[index], onSelectMeal: selectMeal);
      },
      itemCount: meals.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    
    if(title == null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Meals for $title'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index], onSelectMeal: selectMeal);
        },
        itemCount: meals.length,
      ),
    );
  }
}
