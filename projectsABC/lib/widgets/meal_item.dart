import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal, required this.onSelectMeal}) : super(key: key);

  final Meal meal;
  final void Function(BuildContext ctx,Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
        onTap: () {onSelectMeal(context,meal);},
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(children: [
                  Text(meal.title,maxLines: 2, textAlign: TextAlign.center, softWrap: true, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold, 
                      color: Colors.white,
                    ),),
                  Text('${meal.duration} min', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                    const SizedBox(width: 6),
                    MealItemTrait(icon: Icons.work, label: '$complexityText'),
                    const SizedBox(width: 6),
                    MealItemTrait(icon: Icons.attach_money, label: '${meal.affordability.name[0].toUpperCase()}${meal.affordability.name.substring(1)}' ),
                  ],)
                ],)
              ))
          ],
        ),
      )
    );
  }
}