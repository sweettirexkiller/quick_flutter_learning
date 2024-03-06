import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, required this.title, required this.meals}) : super(key: key);

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Meals for $title'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(meals[index].title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ));
        },
        itemCount: meals.length,
      ),
    );
  }
}
