import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/main.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Image.network(
        meal.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
        height: 300,
      ),
    );
  }
}