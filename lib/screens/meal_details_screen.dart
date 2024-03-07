import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key, required this.meal, required this.onToggleFavorite}) : super(key: key);

  final Meal meal;
  final void Function(Meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
            ),
            const SizedBox(height: 10),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 10),
            for(final ingredient in meal.ingredients) 
              Text(ingredient, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
             Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 10),
            for(final step in meal.steps) 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(step, 
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)
                    ),
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}