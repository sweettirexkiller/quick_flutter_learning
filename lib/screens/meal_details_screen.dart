import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_application_tutorial_namer_app/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);

  final Meal meal;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
             final wasAdded = ref.read(favoriteMealsProvider.notifier).toggleFavorite(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded? 'Added to favorites' : 'Removed from favorites'),
                  duration: const Duration(seconds: 2),
                ));
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