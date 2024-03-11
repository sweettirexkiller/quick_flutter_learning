import 'package:flutter_application_tutorial_namer_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    final existingIndex = state.indexWhere((element) => element.id == meal.id);
    if (existingIndex >= 0) {
      state = List.from(state)..removeAt(existingIndex);
      return false;
    } else {
      state = List.from(state)..add(meal);
      return true;
    }
  }

  bool isFavorite(Meal meal) {
    return state.any((element) => element.id == meal.id);
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});