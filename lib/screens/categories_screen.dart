
import 'package:flutter/material.dart';
import 'package:flutter_application_tutorial_namer_app/data/dummy_data.dart';
import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_application_tutorial_namer_app/screens/meals_screen.dart';
import 'package:flutter_application_tutorial_namer_app/widgets/category_grid_item.dart';
import '../models/category.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key, required this.availableMeals}) : super(key: key);
  
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(title: category.title, meals: filteredMeals);
        },
      ),
    );
  } 

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (ctx, widget)=> SlideTransition(
        position: 
        Tween(begin: Offset(0,0.3),end:Offset(0,0))
        .animate(
          CurvedAnimation(
            parent: _animationController, 
            curve: Curves.easeInOut)),
            child: widget
            ),
      );
  }
}