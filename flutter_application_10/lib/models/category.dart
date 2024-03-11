
import 'package:flutter/material.dart';


enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class Category {
  final String title;
  final Color color;

  const Category(this.title, this.color);
}



// Path: flutter_application_10/lib/models/grocery_item.dart
